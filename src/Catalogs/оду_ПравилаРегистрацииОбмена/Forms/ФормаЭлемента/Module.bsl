
&НаКлиенте
Процедура ПутьКОбработкеОтладкиНачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка)
	
	ПолноеИмяФайла = пр_Клиент.ВыборКаталогаФайлаНачалоВыбора();
	Если ЗначениеЗаполнено(ПолноеИмяФайла)  Тогда
		Объект.ПутьКОбработкеОтладки = ПолноеИмяФайла; 
		Если НЕ ЗначениеЗаполнено(Объект.Код)  Тогда
		    Объект.Код = пр_Общий.ИмяФайлаПоПути(ПолноеИмяФайла);
		КонецЕсли; 
	КонецЕсли;
	
КонецПроцедуры
