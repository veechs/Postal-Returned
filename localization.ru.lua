if GetLocale() == "ruRU" then
POSTAL_HELP = "Заполните любое количество слотов. Каждый предмет будет отправлен отдельным письмом получателю с указанной вами темой, за которой следует название предмета и количество (например: <Тема> [Золотой слиток x10]). Общая стоимость отправки отображается в правом верхнем углу. Вы можете зажать Alt и кликнуть по предметам в сумках, чтобы автоматически добавить их в список.";

POSTAL_SEND = "Массовая рассылка";
POSTAL_SENDBUTTON = "Отправить";
POSTAL_CANCELBUTTON = "Отмена";

POSTAL_SENDINFO = "Вы уверены, что хотите отправить письмо? Общая стоимость отправки:";
POSTAL_SENDINFO2 = "Вы отправляете:";
POSTAL_ITEMS = "Предмет(ы)";
POSTAL_ABORT = "Прервать";

POSTAL_ITEMNUM = "Предмет %d из %d.";
POSTAL_SENDING = "Отправка письма |c00FFFFFF%d|r/|c00FFFFFF%d|r...";
POSTAL_DONESENDING = "Отправлено |c00FFFFFF%d|r писем!";
POSTAL_ABORTED = "Прервано. Отправлено |c00FFFFFF%d|r/|c00FFFFFF%d|r писем.";
POSTAL_ERROR = "Произошла ошибка в POSTAL. Это может быть связано с задержкой, попыткой отправить предметы через обычное окно отправки писем или попыткой отправить предметы, которые нельзя отправить.";

POSTAL_INBOX_OPENSELECTED = "Открыть выбранные";
POSTAL_INBOX_OPENALL = "Открыть все";
POSTAL_INBOX_OPENALLTITLE = "Открыть все?";
POSTAL_INBOX_OPENALLCONFIRMATION = "Вы уверены, что хотите открыть все письма?";
POSTAL_INBOX_DISPLAYPROCESSMESSAGES = "Показывать сообщения о процессе";

POSTAL_MASS_MAIL = "Массовая рассылка";
POSTAL_FORWARD = "Переслать";

POSTAL_INBOX_RETURNSELECTED = "Вернуть выбранные";
POSTAL_INBOX_RETURNALL = "Вернуть все";
POSTAL_INBOX_RETURNTOOLTIP = "Это письмо было возвращено вам.";
POSTAL_INBOX_AUCTIONTOOLTIP = "Это письмо было отправлено аукционом.";
POSTAL_INBOX_AUCTIONHOUSES = 
{
	["Аукцион Штормграда"]=true,
	["Аукцион Альянса"]=true,
	["Аукцион Дарнасса"]=true,
	["Аукцион Подгорода"]=true,
	["Аукцион Громового Утёса"]=true,
	["Аукцион Орды"]=true,
	["Аукцион Черноводья"]=true,
};

POSTAL_ITEM_RECEIVED = "Получено от |c%s%s|r: %s (x%d)"  -- "Получено от <цвет выделения><отправитель>: <предмет> (x<количество>)"
POSTAL_MONEY_RECEIVED = "Получено от |c%s%s|r: %s"  -- "Получено от <цвет выделения><отправитель>: <деньги>"
POSTAL_AUCTION_SOLD = "Продано |c%s%s|r: %s"  -- "Продано <цвет выделения><предмет>: <деньги>"
POSTAL_TOTAL_MONEY = "Всего получено: %s"
POSTAL_AUCTION_SUCCESSFUL_SUBJECT_PATTERN = "^Аукцион успешен: "
end
