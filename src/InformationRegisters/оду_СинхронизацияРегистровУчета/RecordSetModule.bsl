
Процедура ПередЗаписью(Отказ, Замещение)
	
	//TODO:  Доделать
	//Ошибка при удалении
	//Удаляет все записи по объекту, тк ведущее, возможно По ИД еще нужно.
	
	//{<Неизвестный модуль>(21)}: Ошибка при вызове метода контекста (Удалить): Ошибка при выполнении обработчика - 
	//'ПередЗаписью': {РегистрСведений.оду_СинхронизацияРегистровУчета.МодульНабораЗаписей(21)}: Поле объекта не обнаружено (ИДОбъекта)

	//Отбор.ОбъектОбмена
	////Очистить файлы выгрузки КД, при удалении записи
	////Запись пустого, запись значений, либо удаление
	//Если ЭтотОбъект.Количество() = 0 Тогда 
	//
	//	Запрос = Новый Запрос;
	//	Запрос.Текст = 
	//		"ВЫБРАТЬ
	//		|	оду_ОшибкиОбмена.ИмяФайлаОбмена КАК ИмяФайлаОбмена
	//		|ИЗ
	//		|	РегистрСведений.оду_ОшибкиОбмена КАК оду_ОшибкиОбмена
	//		|ГДЕ
	//		|	оду_ОшибкиОбмена.ИДОбъекта = &ИДОбъекта
	//		|	И оду_ОшибкиОбмена.ИДБазыИсточник = &ИДБазыИсточник
	//		|	И оду_ОшибкиОбмена.ИДБазыПриемник = &ИДБазыПриемник";

	//	Запрос.УстановитьПараметр("ИДБазыИсточник", Отбор.ИДБазыИсточник.Значение);
	//	Запрос.УстановитьПараметр("ИДБазыПриемник", Отбор.ИДБазыПриемник.Значение);
	//	Запрос.УстановитьПараметр("ИДОбъекта",  Отбор.ИДОбъекта.Значение);

	//	РезультатЗапроса = Запрос.Выполнить();

	//	ВДЗ = РезультатЗапроса.Выбрать();
	//	
	//	Если ВДЗ.Следующий() Тогда
	//		Если ЗначениеЗаполнено(ВДЗ.ИмяФайлаОбмена)  Тогда
	//			УдалитьФайлы(ВДЗ.ИмяФайлаОбмена);
	//		КонецЕсли; 	
	//	КонецЕсли; 
	//	
	//КонецЕсли;
	
КонецПроцедуры
