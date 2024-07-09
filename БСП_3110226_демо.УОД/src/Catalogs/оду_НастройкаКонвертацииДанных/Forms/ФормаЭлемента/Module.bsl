
#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	НастройкаФормы();
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовШапкиФормы

&НаКлиенте
Процедура КодПриИзменении(Элемент)
	ЗаполнитьКаталогХраненияФайловОбмена();
КонецПроцедуры

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

&НаКлиенте
Процедура ПутьКПОДНачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка)
	
	ПолноеИмяФайла = пр_Клиент.ВыборКаталогаФайлаНачалоВыбора();
	Если ЗначениеЗаполнено(ПолноеИмяФайла)  Тогда
		Объект.ПутьКПОД = ПолноеИмяФайла; 
		Объект.ПОДИзФайла = Истина; 
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ПОДИзОбработкиБСППриИзменении(Элемент)
	Объект.ПОДИзФайла = НЕ Объект.ПОДИзОбработкиБСП;
КонецПроцедуры

&НаКлиенте
Процедура ПОДИзФайлаПриИзменении(Элемент)
	Объект.ПОДИзОбработкиБСП = НЕ Объект.ПОДИзФайла;
КонецПроцедуры

&НаКлиенте
Процедура РежимОтладкиПриИзменении(Элемент)  
	//Элементы.ГруппаОтладки.Доступность = Объект.РежимОтладки;
КонецПроцедуры

&НаКлиенте
Процедура КонфигурацияКонвертацииОбменаПриИзменении(Элемент)
	//НастройкаФормы();
КонецПроцедуры

#Область  Отладки

&НаКлиенте
Процедура КаталогОбменаНачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка)
	пр_Клиент.УстановкаКаталогаФайлаНачалоВыбора(Объект, "КаталогОбмена", Ложь);	
КонецПроцедуры

&НаКлиенте
Процедура ПутьКФайлуОбменаНачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка)
	пр_Клиент.УстановкаКаталогаФайлаНачалоВыбора(Объект, "ПутьКФайлуОбмена", , Объект.КаталогОбмена);	
КонецПроцедуры

//&НаКлиенте
//Процедура ПутьКФайлуОбменаЗапросНачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка)
//	пр_Клиент.УстановкаКаталогаФайлаНачалоВыбора(Объект, "ПутьКФайлуОбменаЗапрос", , Объект.КаталогОбмена);	
//КонецПроцедуры

//&НаКлиенте
//Процедура ПутьКФайлуОбменаОтветНачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка)
//	пр_Клиент.УстановкаКаталогаФайлаНачалоВыбора(Объект, "ПутьКФайлуОбменаОтвет", , Объект.КаталогОбмена);	
//КонецПроцедуры

&НаКлиенте
Процедура ОбъектОбменаОкончаниеВводаТекста(Элемент, Текст, ДанныеВыбора, ПараметрыПолученияДанных, СтандартнаяОбработка)
	пр_Клиент.Объект1СОкончаниеВводаТекста(ОбъектОбмена, Текст, СтандартнаяОбработка);
КонецПроцедуры

#КонецОбласти
 

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормы_ЭтапыЗапросов

&НаКлиенте
Процедура ЭтапыЗапросовПутьКФайлуОбменаЗапросНачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка)
	
	ТекЭлемент = Элементы.ЭтапыЗапросов.ТекущиеДанные;
	
	Если ТекЭлемент = Неопределено Тогда
		Возврат;
	КонецЕсли;
	 
	пр_Клиент.УстановкаКаталогаФайлаНачалоВыбора(ТекЭлемент, "ПутьКФайлуОбменаЗапрос", , Объект.КаталогОбмена);
	
КонецПроцедуры

&НаКлиенте
Процедура ЭтапыЗапросовПутьКФайлуОбменаОтветНачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка)
	
	ТекЭлемент = Элементы.ЭтапыЗапросов.ТекущиеДанные;
	
	Если ТекЭлемент = Неопределено Тогда
		Возврат;
	КонецЕсли;
	 
	пр_Клиент.УстановкаКаталогаФайлаНачалоВыбора(ТекЭлемент, "ПутьКФайлуОбменаОтвет", , Объект.КаталогОбмена);
	
КонецПроцедуры


#КонецОбласти

#Область ОбработчикиКомандФормы

&НаКлиенте
Процедура ВыгрузитьВФайл(Команда)

	Попытка
	
		ТекЭлемент = ПолучитьТекущийЭтапЗапроса();
		Если ПолучитьТекущийЭтапЗапроса() = Неопределено Тогда
			Возврат;
		КонецЕсли; 
		
		СтруктураПараметров = ПараметрыКонвертацииОбъекта(); 
		СтруктураПараметров.Вставить("ЭтапЗапроса", ТекЭлемент.НомерСтроки); 
		СтруктураПараметров.Вставить("ПутьКФайлуОбмена", ПутьКФайлуОбмена); 
		
		Если ТекЭлемент.ТребуетсяВводДопНастроекПередВыгрузкой = Истина Тогда
			//Открываем обработку для ввода\
			ФормаОбмена = Неопределено;
			ОписОповещФормы = Новый ОписаниеОповещения("ПослеПолученияДанныхЗапроса", ЭтаФорма); //ЭтаФорма, ЭтотОбъект
			
			Если Объект.ИспользоватьОбработкуБСП = Истина И ЗначениеЗаполнено(Объект.ОбработкаОтладкиБСП)  Тогда
				//ФормаОбмена = пр_Общий.ВнешняяОбработкаБСП(, Объект.ОбработкаОтладкиБСП);
				пр_Клиент.ОткрытьФормуВнешнююОбработкиБСП(, Объект.ОбработкаОтладкиБСП, , СтруктураПараметров,,,,,ОписОповещФормы);
				//ФормаОбмена = пр_Клиент.ПолучитьФормуВнешнейОбработкиБСП( , Объект.ОбработкаОтладкиБСП, , СтруктураПараметров);
			ИначеЕсли ЗначениеЗаполнено(Объект.ПутьКОбработкеОтладки)	Тогда 
				//ФормаОбмена = пр_Клиент.ПолучитьФормуПоПути(Объект.ПутьКОбработкеОтладки, , , СтруктураПараметров);		
				пр_Клиент.ОткрытьФормуВнешнейОбработки(Объект.ПутьКОбработкеОтладки, , СтруктураПараметров,,,,,ОписОповещФормы);
			Иначе 
				//ФормаОбмена = Объект.ПравилоВыгрузки;
			КонецЕсли; 	
			
			//Если ФормаОбмена <> Неопределено Тогда
			//	ФормаОбмена.Открыть();
			//КонецЕсли; 
			
		ИначеЕсли Объект.КонфигурацияКонвертацииОбмена = оду_ОбщийПовтИсп.КонфигурацияКД2() Тогда
			
			оду_Общий.РезультатВыгрузкиОбъектовИзНастроекУОКД2(СтруктураПараметров);
			
			//ПутьКФайлуОбмена
			//Если НЕ ЗначениеЗаполнено(ИмяФайлаОбмена)  Тогда
			//Если НЕ ЗначениеЗаполнено(ПутьКФайлуОбмена) И ЗначениеЗаполнено(Объект.КаталогОбмена)  Тогда
			//	ИмяФайлаОбмена = Объект.Код + 
			//	ПутьКФайлуОбмена = Объект.Код;	
			//	ПолныйПутьКФайлу(, ИмяФайла = "", Объект.КаталогОбмена, ТипХранения = ".json", СоздаватьКаталогЕслиНеСуществует = Ложь) Экспорт
			//КонецЕсли; 

		Иначе
			РезультатПолученияДанных = РезультатПолученияДанныхПроизвольногоЗапроса(СтруктураПараметров);
			РезультатВыгрузкиДанных(РезультатПолученияДанных);
		КонецЕсли; 
		
	Исключение
		пр_Ошибка = ОписаниеОшибки();
		Сообщение = Новый СообщениеПользователю;
		Сообщение.Текст = пр_Ошибка;
		Сообщение.Сообщить(); 
		оду_Общий.ОтправитьСообщениеВТелеграмExchange("ВыгрузитьВФайл", , пр_Ошибка);	
	КонецПопытки;
	
КонецПроцедуры

&НаКлиенте
Процедура ЗагрузитьИзФайла(Команда)
	ЗагрузитьИзФайлаНаСервере();
КонецПроцедуры

&НаКлиенте
Процедура ОбработкаОтветаИзФайла(Команда)
	ОбработкаОтветаИзФайлаНаСервере();
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаСервере
Процедура НастройкаФормы()
	
	Если Параметры.Свойство("Ссылка") Тогда
		Если ЗначениеЗаполнено(Параметры.Ссылка)  Тогда
		    РеквОбъект = Параметры.Ссылка.ПолучитьОбъект(); 
			ЗначениеВРеквизитФормы(РеквОбъект, "Объект"); 
		КонецЕсли; 
	КонецЕсли; 
	
	Если Параметры.Свойство("РежимОтладки") Тогда
		Объект.РежимОтладки = Параметры.РежимОтладки;
	КонецЕсли; 
	
	Если Параметры.Свойство("УчастникОбмена") Тогда
		УчастникОбмена = Параметры.УчастникОбмена;
	КонецЕсли; 
	
	Если Параметры.Свойство("ИмяБазыПриемника") Тогда
		ИмяБазыПриемника = Параметры.ИмяБазыПриемника;
	КонецЕсли; 
	
	Если НЕ ЗначениеЗаполнено(Объект.РежимОбмена)  Тогда
		Если Параметры.Свойство("ТекущаяБД") Тогда
			Объект.РежимОбмена = ?(Параметры.ТекущаяБД = Истина, оду_ОбщийПовтИсп.РежимЗагрузка(), оду_ОбщийПовтИсп.РежимВыгрузка());
		КонецЕсли; 
	КонецЕсли; 

	//TODO:  Доделать
	Если НЕ ЗначениеЗаполнено(Объект.ИмяПВД)  Тогда
  		Объект.ИмяПВД = "УниверсальноеПВД";
	КонецЕсли; 
	
	ЗаполнитьКаталогХраненияФайловОбмена();
	
	Элементы.ГруппаОтладки.Доступность = Объект.РежимОтладки;
	//Элементы.ГруппаВыгрузка.Видимость = Объект.КонфигурацияКонвертацииОбмена = ПредопределенноеЗначение("Перечисление.оду_КонфигурацияКонвертацииДанных.Произвольная");
		
КонецПроцедуры

//TODO:  
//Признак что - выгружать чз файл
&НаСервере
Процедура ЗаполнитьКаталогХраненияФайловОбмена()
	
	Если НЕ ЗначениеЗаполнено(Объект.КаталогОбмена) И ЗначениеЗаполнено(ИмяБазыПриемника) И ЗначениеЗаполнено(Объект.Код)  Тогда
		НастройкиТекущейБД = оду_ОбщийПовтИсп.НастройкиТекущейБД();
		Объект.КаталогОбмена = оду_Общий.КаталогФайлаОбмена(НастройкиТекущейБД, ИмяБазыПриемника);
		Если ЗначениеЗаполнено(Объект.КаталогОбмена)  Тогда
			Объект.КаталогОбмена = СтрШаблон("%1\%2\%3", Объект.КаталогОбмена, "arbitraryRequests", Объект.Код);
		КонецЕсли; 
	КонецЕсли;
	
КонецПроцедуры
 

#Область  ОтладкаОбмена

&НаКлиенте
Процедура ПослеПолученияДанныхЗапроса(ПараметрыЗакрытия, Параметры) Экспорт 
	РезультатВыгрузкиДанных(ПараметрыЗакрытия);
КонецПроцедуры 

&НаКлиенте
Функция ПроходитПроверкуНаМодифицированность()
	
	Если Модифицированность Тогда
		Оповещение = Новый ОписаниеОповещения("ПослеПроверкиНаСохранениеФормы", ЭтаФорма);
		ТекстВопроса = "*оду. Объект изменен. Метод можно вызвать только после сохранения. Сохранить изменения ?";
		ПоказатьВопрос(Оповещение, ТекстВопроса, РежимДиалогаВопрос.ДаНетОтмена);
		Возврат Ложь;
	КонецЕсли;
	
	Возврат Истина;
	
КонецФункции 

&НаКлиенте
Процедура ПослеПроверкиНаСохранениеФормы(Результат, ДополнительныеПараметры) Экспорт
	
	Если Результат = КодВозвратаДиалога.Да Тогда
		Записать();
	КонецЕсли;
	
КонецПроцедуры

//TODO:  Возможно несколько вариантов исполнения
// Открытие обработки для заполненния доп. параметров, либо выполнение сразу
&НаСервере
Функция РезультатПолученияДанныхПроизвольногоЗапроса(СтруктураПараметров)
	
	//ДанныеПроизвольногоЗапроса = Неопределено;
	
	Если Объект.РежимОтладки = Истина Тогда
		
		Если Объект.ИспользоватьОбработкуБСП = Истина И ЗначениеЗаполнено(Объект.ОбработкаОтладкиБСП)  Тогда
			ИсполняемыйМодуль = пр_Общий.ВнешняяОбработкаБСП(, Объект.ОбработкаОтладкиБСП);
		ИначеЕсли ЗначениеЗаполнено(Объект.ПутьКОбработкеОтладки)	Тогда 
			ИсполняемыйМодуль = пр_Общий.ПолучитьВнешнююОбработкуПоПути(Объект.ПутьКОбработкеОтладки);	
		Иначе 
			ИсполняемыйМодуль = Объект.ПравилоВыгрузки;
		КонецЕсли; 	
	Иначе
		ИсполняемыйМодуль = Объект.ПравилоВыгрузки;
	КонецЕсли; 	
	
	Если ТипЗнч(ИсполняемыйМодуль) = Тип("Строка") Тогда
		Если ЗначениеЗаполнено(Объект.ПравилоВыгрузки)  Тогда
			Выполнить(ИсполняемыйМодуль);
		КонецЕсли;
	Иначе
		РезультатПолученияДанных = ИсполняемыйМодуль.РезультатПолученияДанныхПроизвольногоЗапроса(СтруктураПараметров);	
	КонецЕсли;
	
	Возврат РезультатПолученияДанных;
	
КонецФункции

&НаСервере
Процедура ЗагрузитьИзФайлаНаСервере()
	// Вставить содержимое обработчика.
КонецПроцедуры

&НаСервере
Процедура ОбработкаОтветаИзФайлаНаСервере()
	// Вставить содержимое обработчика.
КонецПроцедуры

#КонецОбласти
 
&НаСервере
Функция РезультатВыгрузкиДанных(СтруктураПараметров)
	
	Если СтруктураПараметров = Неопределено Тогда
		Возврат Ложь;
	КонецЕсли; 	
	
	Если СтруктураПараметров.ДанныеОбмена = Неопределено Тогда
		Сообщение = Новый СообщениеПользователю;
		Сообщение.Текст = "*оду. Нет данных для запроса";
		Сообщение.Сообщить();
		Возврат Ложь;
	КонецЕсли; 
	
	пр_Модуль = пр_Общий.ИсполняемыйМодуль("оду_Общий", пр_НастройкиПовтИсп.ТекущийПользователь()); 
	Если пр_Модуль = Неопределено Тогда
		пр_Модуль = оду_Общий;
	КонецЕсли; 
	
	//instruct = пр_Модуль.СтруктураИнструкцииВыполненияОбмена();
	//ЗаполнитьЗначенияСвойств(instruct, СтруктураПараметров); 
	//
	//СтруктураОтвета = пр_Модуль.СтруктураОтветаУниверсальногоОбменаПоМетодуСсылкеУО(УчастникОбмена, СтруктураПараметров.ДанныеОбмена, instruct);
	
	//СтруктураОтвета = пр_Модуль.РезультатВыполненияПроизвольногоЗапроса(УчастникОбмена, Объект.Ссылка, СтруктураПараметров.ДанныеОбмена, ЭтапЗапроса);

КонецФункции 

//Если требуется передать доп данные для получения данных обмена
&НаКлиенте
Функция ПараметрыКонвертацииОбъекта()
	
	ПараметрыКонвертацииОбъекта = оду_ОбщийПовтИсп.ПараметрыКонвертацииОбъекта();
	ЗаполнитьЗначенияСвойств(ПараметрыКонвертацииОбъекта, Объект.Ссылка); 
	ПараметрыКонвертацииОбъекта.НастройкаКонвертации = Объект.Ссылка;
	ПараметрыКонвертацииОбъекта.УО = УчастникОбмена;
	
	Возврат  ПараметрыКонвертацииОбъекта;
	
КонецФункции

&НаКлиенте
Функция ПолучитьТекущийЭтапЗапроса()
	
	ЭтапЗапроса = 0;
	Если ПроходитПроверкуНаМодифицированность() = Ложь Тогда
		Возврат Неопределено;
	КонецЕсли; 
	
	ТекЭлемент = Элементы.ЭтапыЗапросов.ТекущиеДанные;
	
	Если ТекЭлемент = Неопределено Тогда
		Сообщение = Новый СообщениеПользователю;
		Сообщение.Текст = "*оду. Запрос не выполнен. Не выбран этап запроса";
		Сообщение.Сообщить(); 
		Возврат Неопределено;
	КонецЕсли;
	
	ЭтапЗапроса = ТекЭлемент.НомерСтроки;
	Возврат ТекЭлемент;

КонецФункции 

//TODO:  
&НаКлиенте
Функция ЗаполнитьСтруктуруПараметров()
	
	ТекЭлемент = ПолучитьТекущийЭтапЗапроса();
	Если ПолучитьТекущийЭтапЗапроса() = Неопределено Тогда
		Возврат Неопределено;
	КонецЕсли; 
	
	//instruct = оду_Общий.СтруктураИнструкцииВыполненияОбмена();
	instruct = Новый Структура();
	instruct.Вставить("methodName", Объект.Код);
	instruct.Вставить("stage", ТекЭлемент.НомерСтроки);
	instruct.Вставить("exchangeMode", Объект.РежимОбмена);
	instruct.Вставить("debug", Объект.РежимОтладки);
	instruct.Вставить("exchangeViaFile", Объект.РежимОтладки);
	 
	//Стр = Новый Структура();
	//Стр.Вставить("УчастникОбмена", УчастникОбмена);
	//Стр.Вставить("НастрокаКД", Объект.Ссылка);
	//Стр.Вставить("РежимОтладки", Объект.РежимОтладки);
	//Стр.Вставить("РежимОбмена", Объект.РежимОбмена);
	//
	//
	//Стр.Вставить("ИмяФайлаОбмена", ИмяФайлаОбмена);
	//
	//Стр.Вставить("Этап", ТекЭлемент.НомерСтроки);
	//Стр.Вставить("ОписаниеЗапроса", ТекЭлемент.ОписаниеЗапроса);
	//Стр.Вставить("ПутьКФайлуОбменаЗапрос", ТекЭлемент.ПутьКФайлуОбменаЗапрос);
	//Стр.Вставить("ПутьКФайлуОбменаОтвет", ТекЭлемент.ПутьКФайлуОбменаОтвет);
	
	пр_Общий.ДобавитьСписокСвойстВСтруктуру(instruct);
	
	СтруктураПараметров = Новый Структура("СтруктураПараметров", instruct);
	
	Возврат  СтруктураПараметров;
	
КонецФункции 



#КонецОбласти

#Область СлужебныеПроцедурыИФункцииБСП

#КонецОбласти


