Postal.util = {}

local tempTable = {}
local holds

function Postal.util.set_add(set, key)
    set[key] = true
end

function Postal.util.set_remove(set, key)
    set[key] = nil
end

function Postal.util.set_contains(set, key)
    return set[key] ~= nil
end

function Postal.util.set_size(set)
    local size = 0
	for _,_ in pairs(set) do
		size = size + 1
	end
	return size
end

function Postal.util.set_to_array(set)
	Postal.util.tableClear(tempTable)
	for element, _ in pairs(set) do
		tinsert(tempTable, element)
	end
	return tempTable
end

function Postal.util.any(xs, p)
	holds = false
	for _, x in ipairs(xs) do
		holds = holds or p(x)
	end
	return holds
end

function Postal.util.all(xs, p)
	holds = true
	for _, x in ipairs(xs) do
		holds = holds and p(x)
	end
	return holds
end

function Postal.util.set_filter(xs, p)
	Postal.util.tableClear(tempTable)
	for x, _ in pairs(xs) do
		if p(x) then
			Postal.util.set_add(tempTable, x)
		end
	end
	return tempTable
end

function Postal.util.filter(xs, p)
	Postal.util.tableClear(tempTable)
	for _, x in ipairs(xs) do
		if p(x) then
			tinsert(tempTable, x)
		end
	end
	return tempTable
end

function Postal.util.map(xs, f)
	Postal.util.tableClear(tempTable)
	for _, x in ipairs(xs) do
		tinsert(tempTable, f(x))
	end
	return tempTable
end

function Postal.util.take(n, xs)
	Postal.util.tableClear(tempTable)
	for i=1,n do
		if xs[i] then
			tinsert(tempTable, xs[i])
		end
	end
	return tempTable
end


function Postal.util.tableClear(tbl)
	if type(tbl) ~= "table" then
		return
	end

	-- Clear array-type tables first so table.insert will start over at 1.
	for i = table.getn(tbl), 1, -1 do
        table.remove(tbl, i)
    end

	-- Remove any remaining associative table elements.
	-- Credit: https://stackoverflow.com/a/27287723
	for k in next, tbl do rawset(tbl, k, nil) end
end