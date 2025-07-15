POSTAL_HELP = "Fill in as many slots as you want. Each item will be sent in a separate mail to the recipient, with the subject you specify, followed by the item's name and count (for example: <Subject> [Gold Bar x10]). The combined postage is shown in the top right. You can alt-click on items in your bags to add them to the list automatically.";

POSTAL_SEND = "Mass Mail";
POSTAL_SENDBUTTON = "Send";
POSTAL_CANCELBUTTON = "Cancel";

POSTAL_SENDINFO = "Are you sure you want to send the mail? Total postage will be:";
POSTAL_SENDINFO2 = "You are sending:";
POSTAL_ITEMS = "Item(s)";
POSTAL_ABORT = "Abort";

POSTAL_ITEMNUM = "Item %d out of %d.";
POSTAL_SENDING = "Sending mail |c00FFFFFF%d|r/|c00FFFFFF%d|r...";
POSTAL_DONESENDING = "Done sending |c00FFFFFF%d|r mail(s)!";
POSTAL_ABORTED = "Aborted. |c00FFFFFF%d|r/|c00FFFFFF%d|r mail were sent.";
POSTAL_ERROR = "An error occured in POSTAL. This might be related to lag, trying to send items with an item placed in the normal send mail window, or trying to send items that cannot be sent.";

POSTAL_INBOX_OPENSELECTED = "Open Selected";
POSTAL_INBOX_OPENALL = "Open All";
POSTAL_INBOX_OPENALLTITLE = "Open All?";
POSTAL_INBOX_OPENALLCONFIRMATION = "Are you sure you want to open all mail?";
POSTAL_INBOX_DISPLAYPROCESSMESSAGES = "Display process messages";

POSTAL_INBOX_RETURNSELECTED = "Return Selected";
POSTAL_INBOX_RETURNALL = "Return All";
POSTAL_INBOX_RETURNTOOLTIP = "This mail was returned to you.";
POSTAL_INBOX_FORWARD = "Forward";
POSTAL_INBOX_AUCTIONTOOLTIP = "This mail was sent by an auctionhouse.";
POSTAL_INBOX_AUCTIONHOUSES = 
{
	["Stormwind Auction House"]=true,
	["Alliance Auction House"]=true,
	["Darnassus Auction House"]=true,
	["Undercity Auction House"]=true,
	["Thunder Bluff  Auction House"]=true,
	["Horde Auction House"]=true,
	["Blackwater Auction House"]=true,
};

POSTAL_ITEM_RECEIVED = "Received from |c%s%s|r: %s (x%d)"  -- "Received from <highlight color><sender>: <item> (x<quantity>)"
POSTAL_MONEY_RECEIVED = "Received from |c%s%s|r: %s"  -- "Received from <highlight color><sender>: <money>"
POSTAL_AUCTION_SOLD = "Sold |c%s%s|r: %s"  -- "Sold <highlight color><item>: <money>"
POSTAL_TOTAL_MONEY = "Total received: %s"
POSTAL_AUCTION_SUCCESSFUL_SUBJECT_PATTERN = "^Auction successful: "