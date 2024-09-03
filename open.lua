Postal.open = {}

local wait_for_update, open, process, inventory_count, total_money

local controller = (function()
	local controller
	return function()
		controller = controller or Postal.control.controller()
		return controller
	end
end)()

function wait_for_update(k)
	return controller().wait(function() return true end, k)
end

function Postal.open.start(selected, callback, mode)
	total_money = 0
	Postal.control.on_next_update(function()
		process(selected, function()
			if (total_money > 0) then
				Postal:Print("Total received: "..money_str(total_money), 1, 1, 0)
			end
			callback()
		end, mode)
	end)
end

function Postal.open.stop()
	Postal.control.on_next_update(function()
		controller().reset()
	end)
end

function process(selected, k, mode)
	if getn(selected) == 0 then
		return k()
	else
		local index = selected[1]
		
		local inbox_count = GetInboxNumItems()
		if mode == "open" then
			open(index, inbox_count, function(skipIndex)
				tremove(selected, 1)
				
				if not skipIndex then
					for i, _ in selected do
						selected[i] = selected[i] - 1
					end
				end
				return process(selected, k, mode)
			end)
		elseif mode == "return" then
			returnmail(index, inbox_count, function(skipIndex)
				tremove(selected, 1)
				
				if not skipIndex then
					for i, _ in selected do
						selected[i] = selected[i] - 1
					end
				end
				return process(selected, k, mode)
			end)
		end
	end
end

function returnmail(i, inbox_count, k)
	wait_for_update(function()
		local _, _, _, _, _, _, _, _, _, wasReturned = GetInboxHeaderInfo(i)
		if GetInboxNumItems() < inbox_count then
			return k(false)
		elseif wasReturned then
			return k(true)
		else
			local inbox_count_before = GetInboxNumItems()
			ReturnInboxItem(i)
			controller().wait(function() return GetInboxNumItems() < inbox_count_before end, function()
			return returnmail(i, inbox_count, k)
			end)
		end
	end)
end


function money_str(money)
	--[[
	Taken from pfUI.api.CreateGoldString

	The MIT License (MIT)

	Copyright (c) 2016-2021 Eric Mauser (Shagu)

	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the "Software"), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:

	The above copyright notice and this permission notice shall be included in all
	copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
	SOFTWARE.
	]]--
	
	if type(money) ~= "number" then return "-" end
  
	local gold = floor(money/ 100 / 100)
	local silver = floor(mod((money/100),100))
	local copper = floor(mod(money,100))
  
	local string = ""
	if gold > 0 then string = string .. "|cffffffff" .. gold .. "|cffffd700g" end
	if silver > 0 or gold > 0 then string = string .. "|cffffffff " .. silver .. "|cffc7c7cfs" end
	string = string .. "|cffffffff " .. copper .. "|cffeda55fc"
  
	return string
  end

--This section of code was taken from the original code in 'Postal' by MarcelineVQ: https://github.com/MarcelineVQ/Postal/blob/main/open.lua
--Color modified from bright yellow by Ayri of Turtle WoW, original color code is |cff00ff00 for reference, new one is |cff318ce7
function open(i, inbox_count, k)
    wait_for_update(function()
        local _, _, sender, subject, money, COD_amount, _, has_item = GetInboxHeaderInfo(i)
        if GetInboxNumItems() < inbox_count then
            return k(false)
        elseif COD_amount > 0 then
            return k(true)
        elseif has_item then
            local itm_name, _, itm_qty, _, _ = GetInboxItem(i)
            TakeInboxItem(i)
            Postal:Print("Received from |cff318ce7"..sender.."|r: "..itm_name.." (x"..itm_qty..")", 1, 1, 0)
            controller().wait(function() return not ({GetInboxHeaderInfo(i)})[8] or GetInboxNumItems() < inbox_count end, function()
                return open(i, inbox_count, k)
            end)
        elseif money > 0 then
            TakeInboxMoney(i)
            local _,ix = strfind(subject, "Auction successful: ",1,true)
            local sub
            if ix then sub = strsub(subject,ix) end
            if ix
              then Postal:Print("Sold"..sub..": "..money_str(money), 1, 1, 0)
              else Postal:Print("Received from |cff318ce7"..sender.."|r: "..money_str(money), 1, 1, 0)
            end
            controller().wait(function() return ({GetInboxHeaderInfo(i)})[5] == 0 or GetInboxNumItems() < inbox_count end, function()
                return open(i, inbox_count, k)
            end)
        else
            DeleteInboxItem(i)
            controller().wait(function() return GetInboxNumItems() < inbox_count end, function()
                return open(i, inbox_count, k)
            end)
        end
    end)
end
--End of code section

function inventory_count()
	local acc = 0
	for bag = 0, 4 do
		if GetBagName(bag) then
			for slot = 1, GetContainerNumSlots(bag) do
				local _, count = GetContainerItemInfo(bag, slot)
				acc = acc + (count or 0)
			end
		end
	end
	return acc
end
