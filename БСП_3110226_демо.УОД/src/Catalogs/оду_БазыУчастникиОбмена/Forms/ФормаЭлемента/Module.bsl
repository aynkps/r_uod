
#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриЧтенииНаСервере(ТекущийОбъект)
	// СтандартныеПодсистемы.Свойства
	УправлениеСвойствами.ПриЧтенииНаСервере(ЭтотОбъект, ТекущийОбъект);
	// Конец СтандартныеПодсистемы.Свойства
КонецПроцедуры

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	//Проверка настроек
	//оду_Общий.ПроверкаУзловОбмена();
	НастройкиФормы();
	
	// СтандартныеПодсистемы.Свойства
	ДополнительныеПараметры = УправлениеСвойствамиУНФ.ЗаполнитьДополнительныеПараметры(Объект, "ГруппаДополнительныеРеквизиты");

	ПараметрыОтображенияМеток = УправлениеСвойствами.ПараметрыОтображенияМеток();
	ПараметрыОтображенияМеток.ИмяЭлементаДляРазмещенияМеток = "ГруппаМетки";
	ПараметрыОтображенияМеток.МаксимумМетокНаФорме = 3;
	ПараметрыОтображенияМеток.ВариантОтображенияМеток = Перечисления.ВариантыОтображенияМеток.Картинка;
	ДополнительныеПараметры.Вставить("ПараметрыОтображенияМеток", ПараметрыОтображенияМеток); 
	
	УправлениеСвойствами.ПриСозданииНаСервере(ЭтотОбъект, ДополнительныеПараметры);	
	
	// Конец СтандартныеПодсистемы.Свойства

КонецПроцедуры
 
&НаКлиенте
Процедура ПриОткрытии(Отказ)
	
	// СтандартныеПодсистемы.Свойства
	УправлениеСвойствамиКлиент.ПослеЗагрузкиДополнительныхРеквизитов(ЭтотОбъект);
	// Конец СтандартныеПодсистемы.Свойства
	
КонецПроцедуры


&НаКлиенте
Процедура ОбработкаОповещения(ИмяСобытия, Параметр, Источник)

	// СтандартныеПодсистемы.Свойства
	Если УправлениеСвойствамиКлиент.ОбрабатыватьОповещения(ЭтотОбъект, ИмяСобытия, Параметр) Тогда
		ОбновитьЭлементыДополнительныхРеквизитов();
		УправлениеСвойствамиКлиент.ПослеЗагрузкиДополнительныхРеквизитов(ЭтотОбъект);
	КонецЕсли;
	// Конец СтандартныеПодсистемы.Свойства
	
КонецПроцедуры

&НаСервере
Процедура ОбработкаПроверкиЗаполненияНаСервере(Отказ, ПроверяемыеРеквизиты)
	//
	//Если НЕ ЗначениеЗаполнено(Объект.Ссылка)  Тогда
	//
	//	
	//
	//КонецЕсли; 

	// СтандартныеПодсистемы.Свойства
	УправлениеСвойствами.ОбработкаПроверкиЗаполнения(ЭтотОбъект, Отказ, ПроверяемыеРеквизиты);
	// Конец СтандартныеПодсистемы.Свойства	
	
КонецПроцедуры

&НаСервере
Процедура ПередЗаписьюНаСервере(Отказ, ТекущийОбъект, ПараметрыЗаписи)
	
	// СтандартныеПодсистемы.Свойства
	УправлениеСвойствами.ПередЗаписьюНаСервере(ЭтотОбъект, ТекущийОбъект);
	// Конец СтандартныеПодсистемы.Свойства
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовШапкиФормы

&НаКлиенте
Процедура ПослеЗакрытияФормыВыбораИДОбъекта(ПараметрыВыбора, Параметры) Экспорт
	 
	Если ТипЗнч(ПараметрыВыбора) = Тип("Структура") Тогда
		ТекЭлемент = Элементы.Состав.ТекущиеДанные;
		
		Если ТекЭлемент = Неопределено Тогда
			Возврат;
		КонецЕсли;
		
		ТекЭлемент.Объект = ПараметрыВыбора.ДанныеВыбора;
		ТипXML = ПараметрыВыбора.ТипXML;
		ТекЭлемент.ТипXMLОбъектаИсточника = ТипXML;
		ТекЭлемент.ТипXMLОбъектаПриемника = ТипXML;  //По умолчанию они равны
		//ОбъектПриИзменении("");
	КонецЕсли;
	
КонецПроцедуры 

&НаКлиенте
Процедура ПользовательСсылкаПриИзменении(Элемент)
	Если ЗначениеЗаполнено(Объект.ПользовательСсылка)  Тогда
		СтрРекв = пр_Клиент.ЗначенияРеквизитовОбъекта(Объект.ПользовательСсылка, "Наименование");		
		Объект.Пользователь = НРег(СтрРекв.Наименование);	
	КонецЕсли; 	 
КонецПроцедуры

&НаКлиенте
Процедура ОбъектИсточникКонтраляОстатковПриИзменении(Элемент)
	Если ЗначениеЗаполнено(ОбъектИсточникКонтраляОстатков)  Тогда
		Данные = пр_Клиент.ЗначенияРеквизитовОбъекта(ОбъектИсточникКонтраляОстатков, "ПолноеИмя");
		//ТипXMLОбъектаИсточникаКонтраляОстатков = пр_Общий.ИмяТипаXMLПоСсылке();
		Объект.ТипXMLОбъектаИсточникаКонтраляОстатков = Данные.ПолноеИмя;
	Иначе	
		Объект.ТипXMLОбъектаИсточникаКонтраляОстатков = "";
	КонецЕсли; 
КонецПроцедуры

&НаКлиенте
Процедура ОрганизацииОрганизацияПриИзменении(Элемент)
	
	ТекЭлемент = Элементы.Организации.ТекущиеДанные;
	
	Если ТекЭлемент = Неопределено Тогда
		Возврат;
	КонецЕсли;
	 
	Если ЗначениеЗаполнено(ТекЭлемент.Организация)  Тогда
		
		Если Объект.ТекущаяБД = Истина Тогда
			ТекЭлемент.ИДОбъектаИсточника = пр_Общий.ИД_Ссылки(ТекЭлемент.Организация);
			ТипXML = пр_Общий.ИмяТипаXMLПоСсылке(ТекЭлемент.Организация);
			ТекЭлемент.ТипXMLОбъектаИсточника = ТипXML;
			Если НЕ ЗначениеЗаполнено(ТекЭлемент.ТипXMLОбъектаПриемника) Тогда
				ТекЭлемент.ТипXMLОбъектаПриемника = ТипXML;  //По умолчанию они равны
			КонецЕсли;
		Иначе
			ТекЭлемент.ИДОбъектаПриемника = пр_Общий.ИД_Ссылки(ТекЭлемент.Организация);
			ТипXML = пр_Общий.ИмяТипаXMLПоСсылке(ТекЭлемент.Организация);
			ТекЭлемент.ТипXMLОбъектаПриемника = ТипXML;
			Если НЕ ЗначениеЗаполнено(ТекЭлемент.ИДОбъектаИсточника) Тогда
				ТекЭлемент.ИДОбъектаИсточника = ТипXML;  //По умолчанию они равны
			КонецЕсли;
		КонецЕсли;
		
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура КонтрольОстатковОбъектПриИзменении(Элемент)
	
	ТекЭлемент = Элементы.КонтрольОстатков.ТекущиеДанные;
	
	Если ТекЭлемент = Неопределено Тогда
		Возврат;
	КонецЕсли;
	 
	Если ЗначениеЗаполнено(ТекЭлемент.Объект)  Тогда
		//Данные = пр_Клиент.ЗначенияРеквизитовОбъекта(ОбъектИсточникКонтраляОстатков, "ПолноеИмя");
		Данные = пр_Клиент.ЗначенияРеквизитовОбъекта(ТекЭлемент.Объект, "ЗначениеПустойСсылки, ПолноеИмя");
		МТипа = СтрРазделить(Данные.ПолноеИмя, ".", Ложь);
		ИмяТипа = МТипа[0];
		ИмяМД = МТипа[1];
		
		Если ИмяТипа = "РегистрНакопления" Тогда
			ТипXML = "AccumRg." + ИмяМД;
		ИначеЕсли ИмяТипа = "РегистрСведений" Тогда	
			ТипXML = "InfoRg." + ИмяМД;
		ИначеЕсли ИмяТипа = "РегистрБухгалтерии" Тогда	
			ТипXML = "AccRg." + ИмяМД;
		Иначе
			Если  Данные.ЗначениеПустойСсылки <> Неопределено  Тогда
				ТипXML = пр_Общий.ИмяТипаXMLПоСсылке(Данные.ЗначениеПустойСсылки); 
			Иначе 
				ТипXML = ""; 
			КонецЕсли;
		КонецЕсли;
		
		Если Объект.ТекущаяБД = Истина Тогда
			ТекЭлемент.ТипXMLОбъектаИсточника = ТипXML;
			Если НЕ ЗначениеЗаполнено(ТекЭлемент.ТипXMLОбъектаПриемника) Тогда
				ТекЭлемент.ТипXMLОбъектаПриемника = ТипXML;  //По умолчанию они равны
			КонецЕсли;
		Иначе
			ТекЭлемент.ТипXMLОбъектаПриемника = ТипXML;
			Если НЕ ЗначениеЗаполнено(ТекЭлемент.ТипXMLОбъектаИсточника) Тогда
				ТекЭлемент.ТипXMLОбъектаИсточника = ТипXML;  //По умолчанию они равны
			КонецЕсли;
		КонецЕсли;
		
		ТекЭлемент.Контролировать = Истина;
		
	КонецЕсли;
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормы_Состав

&НаКлиенте
Процедура СоставОбъектНачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка)
	
	СтандартнаяОбработка = Ложь;
	
	//Если РежимОтладки = Истина Тогда
	//	СтандартнаяОбработка = Не РежимОтладки;
	//	Путь = "\\pivo.local\Resource\Личные\Кириллов ПС\r\ut_2021\work\оду_ОбменДанными.epf";
	//	//ПарамФормы = Новый Структура("Узел", Узел);
	//	ОписОповещФормы = Новый ОписаниеОповещения("ПослеЗакрытияФормыВыбораИДОбъекта", ЭтаФорма);
	//	//пр_Клиент.ОткрытьФормуВнешнейОбработки(Путь, "ФормаВыбораИДОбъекта", ПарамФормы, ЭтаФорма, ОписОповещФормы);//, "оду_ОбменДанными");
	//	пр_Клиент.ОткрытьФормуВнешнейОбработки(Путь, "ФормаВыбораИДОбъекта", , ЭтаФорма, ОписОповещФормы);//, "оду_ОбменДанными");
	//Иначе
		
		ОписОповещФормы = Новый ОписаниеОповещения("ПослеЗакрытияФормыВыбораИДОбъекта", ЭтаФорма); 
		
		//ПарамФормы = Новый Структура("Родитель", ТипОбъекта);
		//ОткрытьФорму("РегистрСведений.оду_НастрокаПриоритетаОбъектаОбмена.Форма.ФормаВыбораОбъекта", 
		//					ПарамФормы, ЭтаФорма,,,, ОписОповещФормы);
		ОткрытьФорму("РегистрСведений.оду_НастрокаПриоритетаОбъектаОбмена.Форма.ФормаВыбораОбъекта", , 
					ЭтаФорма,,,, ОписОповещФормы);
	//КонецЕсли; 

КонецПроцедуры

&НаКлиенте
Процедура СоставОбъектПриИзменении(Элемент) 
	
	ТекЭлемент = Элементы.Состав.ТекущиеДанные;
	
	Если ТекЭлемент = Неопределено Тогда
		Возврат;
	КонецЕсли; 
	
	Если ЗначениеЗаполнено(ТекЭлемент.Объект) Тогда    
		
		ТипXML = "";
		Если ТипЗнч(ТекЭлемент.Объект) = Тип("СправочникСсылка.ИдентификаторыОбъектовМетаданных") Тогда
			
			//Данные = пр_Клиент.ЗначенияРеквизитовОбъекта(ОбъектИсточникКонтраляОстатков, "ПолноеИмя");
			Данные = пр_Клиент.ЗначенияРеквизитовОбъекта(ТекЭлемент.Объект, "ЗначениеПустойСсылки");
			Если Данные.ЗначениеПустойСсылки <> Неопределено Тогда
				ТипXML = пр_Общий.ИмяТипаXMLПоСсылке(Данные.ЗначениеПустойСсылки);
			Иначе
				МассивИмени	= СтрРазделить(ТекЭлемент.Объект.ПолноеИмя, ".");  
				Если МассивИмени.Количество() = 2 Тогда  
					ИмяТипа = МассивИмени[0];
					Имя = МассивИмени[1];
					Если ИмяТипа = "РегистрСведений" Тогда
						//ИмяТипа = "InfoRg";
						ИмяТипа = "InformationRegisterRecordSet";
					ИначеЕсли ИмяТипа = "РегистрНакопления"  Тогда
						ИмяТипа = "AccumRg";
					КонецЕсли;
					
					ТипXML = СтрШаблон("%1.%2", ИмяТипа, Имя); 		
					
				КонецЕсли;
			КонецЕсли;  
		КонецЕсли;  
		
		Если ТипXML <> "" Тогда
			ТекЭлемент.ТипXMLОбъектаИсточника = ТипXML;
			ТекЭлемент.ТипXMLОбъектаПриемника = ТипXML;  //По умолчанию они равны   
			ТекЭлемент.Регистрировать = Истина;
			ТекЭлемент.ИспользоватьСамолет = Истина;
		КонецЕсли;
		
	КонецЕсли;  
	
КонецПроцедуры

#КонецОбласти

#Область  ОбработчикиСобытийЭлементовТаблицыФормы_ПроизвольныйЗапрос

&НаКлиенте
Процедура ПроизвольныйЗапросВыполнить(Команда)
	ПроизвольныйЗапросВыполнитьНаСервере();
КонецПроцедуры

&НаСервере
Процедура ПроизвольныйЗапросВыполнитьНаСервере()
	// Вставить содержимое обработчика.
КонецПроцедуры

#КонецОбласти
 
#Область ОбработчикиКомандФормы

&НаКлиенте
Процедура ПолучитьИзПриемника(Команда)
	ВыполнитьМетодПодключенияКУчатсникуОбмена("ПолучитьИзПриемника");
КонецПроцедуры

&НаКлиенте
Процедура ПроверитьСвязь(Команда)
	ВыполнитьМетодПодключенияКУчатсникуОбмена("ПроверитьСвязь");
КонецПроцедуры

&НаКлиенте
Процедура exchangeStatus(Команда)
	exchangeStatusНаСервере();
КонецПроцедуры

&НаКлиенте
Процедура ЗаполнитьИДКонфигурации(Команда)
	Объект.ИДКонфигурации = пр_Общий.ИДКонфигурации();
КонецПроцедуры

&НаКлиенте
Процедура СоздатьСлужебногоПользователяДляОбмена(Команда)
	СоздатьСлужебногоПользователяДляОбменаНаСервере();
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаСервере
Процедура НастройкиФормы()
	
	Если Параметры.Свойство("Узел") Тогда
	    РеквОбъект = Параметры.Узел.ПолучитьОбъект(); 
		ЗначениеВРеквизитФормы(РеквОбъект, "Объект"); 
		Элементы.Код.Доступность = НЕ Объект.ТекущаяБД;
	Иначе
		//Элементы.Код.Доступность = Ложь;
		Элементы.Код.ТолькоПросмотр = ЗначениеЗаполнено(Объект.Код);
		СоздатьСлужебногоПользователяДляОбменаНаСервере();
	КонецЕсли; 

	Если НЕ ЗначениеЗаполнено(Объект.РежимОтладки) Тогда
		Объект.РежимОтладки = ОбщегоНазначенияКлиентСервер.СвойствоСтруктуры(Параметры, "РежимОтладки", Ложь);
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ВыполнитьМетодПодключенияКУчатсникуОбмена(ИмяМетодаПодключения)
	
	Если НЕ ЗначениеЗаполнено(Объект.ИДБазы) Тогда
		Объект.ИДБазы = "тест";
	КонецЕсли;
	
	Если ПроверитьЗаполнение() Тогда
		Если ИмяМетодаПодключения = "ПолучитьИзПриемника" Тогда
			ПолучитьИзПриемникаНаСервере();
		Иначе
			СтруктураОтвета = СтруктураОтветаУниверсальногоОбмена(, "ping");
			Если ЗначениеЗаполнено(СтруктураОтвета)  Тогда
				Текст = СтруктураОтвета + " Установлена связь с базой - участником обмена";
			Иначе
				Текст = "Не удалось установить связь";
			КонецЕсли; 
				Сообщение = Новый СообщениеПользователю;
				Сообщение.Текст = Текст;
				Сообщение.Сообщить(); 
		КонецЕсли; 
	КонецЕсли;
	
	Если Объект.ИДБазы = "тест" Тогда
		Объект.ИДБазы = "";
	КонецЕсли; 

КонецПроцедуры

&НаСервере
Процедура ПолучитьИзПриемникаНаСервере()
	
	Модуль_ОбменУниверсальный = пр_НастройкиПовтИсп.ИсполняемыйМодуль("оду_Общий", пр_НастройкиПовтИсп.ТекущийПользователь());
	Данные = Модуль_ОбменУниверсальный.СтруктураДанныхЭтойБазы();
	
	Если ЗначениеЗаполнено(Данные)  Тогда
		ТелоЗапроса = Модуль_ОбменУниверсальный.СформироватьJSON_Сериализ(Данные);
		//ТелоЗапроса = оду_Общий.СформироватьJSON_Сериализ(СтруктураИзТелаHTTPЗапросаУнив(ОтветHTTP);
		СтруктураОтвета = СтруктураОтветаУниверсальногоОбмена(ТелоЗапроса, "receiverData");
		
		Если ЗначениеЗаполнено(СтруктураОтвета)  Тогда
			Если СтруктураОтвета.code = 200 Тогда
				Результ = Модуль_ОбменУниверсальный.РезультатПроверкиЗаписиНовогоУчастникаОбмена(СтруктураОтвета.data);
				Если Результ = "Уже записан" Тогда
					Сообщение = Новый СообщениеПользователю;
					Сообщение.Текст = Результ;
					Сообщение.Сообщить(); 
				КонецЕсли; 
				ЭтаФорма.Прочитать();
			Иначе
			    Сообщить(СтруктураОтвета.error);
			КонецЕсли; 
		КонецЕсли; 
		
	КонецЕсли; 
	
КонецПроцедуры

&НаСервере
Функция СтруктураОтветаУниверсальногоОбмена(ТелоЗапроса = Неопределено, Метод)
	
	Модуль = пр_НастройкиПовтИсп.ИсполняемыйМодуль("оду_ОбщийПовтИсп", пр_НастройкиПовтИсп.ТекущийПользователь());
	НастройкиТекущейБД = Модуль.НастройкиТекущейБД();
	ПараметрыПодключения = Модуль.ПараметрыПодключенияУО();
	
	Модуль_ОбменУниверсальный = пр_НастройкиПовтИсп.ИсполняемыйМодуль("оду_Общий", пр_НастройкиПовтИсп.ТекущийПользователь());
	ЗаполнитьЗначенияСвойств(ПараметрыПодключения, Объект); 
	ПараметрыПодключения.ИмяБазыУО = Объект.Код;
	
	СтруктураОтвета = Модуль_ОбменУниверсальный.СтруктураОтветаУниверсальногоОбмена(ПараметрыПодключения, ТелоЗапроса, Метод);
	Возврат СтруктураОтвета;
	
КонецФункции 

&НаСервере
Процедура exchangeStatusНаСервере()
	
	Модуль = пр_НастройкиПовтИсп.ИсполняемыйМодуль("оду_ОбщийПовтИсп", пр_НастройкиПовтИсп.ТекущийПользователь());
	НастройкиТекущейБД = Модуль.НастройкиТекущейБД();
	ПараметрыПодключения = Модуль.ДанныеОбУчастникахОбмена(НастройкиТекущейБД, Объект.Ссылка);
	
	Модуль_ОбменУниверсальный = пр_НастройкиПовтИсп.ИсполняемыйМодуль("оду_Общий", пр_НастройкиПовтИсп.ТекущийПользователь());
	
	РезультатОбновления = Модуль_ОбменУниверсальный.ОбновитьСостоянияОбмена(ПараметрыПодключения, НастройкиТекущейБД);
	
КонецПроцедуры

&НаСервере
Процедура СоздатьСлужебногоПользователяДляОбменаНаСервере()
	Модуль = пр_НастройкиПовтИсп.ИсполняемыйМодуль("оду_Общий", пр_НастройкиПовтИсп.ТекущийПользователь()); 
	ДанныеПользователя = Модуль.СоздатьСлужебногоПользователяДляРаботыСОбменом(); 
	
	Если ДанныеПользователя <> Неопределено Тогда
		Объект.Пользователь = ДанныеПользователя.Пользователь; 	
		Объект.Пароль 		= ДанныеПользователя.Пароль; 	
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура СерверПриИзменении(Элемент)
	ИмяКаталогаОбменаУчастникаОбмена();
КонецПроцедуры

&НаКлиенте
Процедура КодПриИзменении(Элемент)
	ИмяКаталогаОбменаУчастникаОбмена();
КонецПроцедуры   

&НаКлиенте
Процедура ИмяКаталогаОбменаУчастникаОбмена()
	Если ЗначениеЗаполнено(Объект.Код) И  ЗначениеЗаполнено(Объект.Сервер) Тогда
		Объект.ИмяКаталогаОбмена = оду_Общий.ИмяКаталогаОбменаУчастникаОбмена(Объект.Код, Объект.Сервер);	
	КонецЕсли;	
КонецПроцедуры
 

#КонецОбласти

#Область СлужебныеПроцедурыИФункцииБСП


// СтандартныеПодсистемы.Свойства
//@skip-check module-unused-method
&НаКлиенте
Процедура Подключаемый_СвойстваВыполнитьКоманду(ЭлементИлиКоманда, НавигационнаяСсылка = Неопределено, СтандартнаяОбработка = Неопределено)
	УправлениеСвойствамиКлиент.ВыполнитьКоманду(ЭтотОбъект, ЭлементИлиКоманда, СтандартнаяОбработка);
КонецПроцедуры // Подключаемый_РедактироватьСоставСвойств()

 // СтандартныеПодсистемы.Свойства 
&НаСервере
Процедура ОбновитьЭлементыДополнительныхРеквизитов()
    УправлениеСвойствами.ОбновитьЭлементыДополнительныхРеквизитов(ЭтотОбъект);
КонецПроцедуры
&НаКлиенте
Процедура ОбновитьЗависимостиДополнительныхРеквизитов()
    УправлениеСвойствамиКлиент.ОбновитьЗависимостиДополнительныхРеквизитов(ЭтотОбъект);
КонецПроцедуры
&НаКлиенте
Процедура Подключаемый_ПриИзмененииДополнительногоРеквизита(Элемент)
    УправлениеСвойствамиКлиент.ОбновитьЗависимостиДополнительныхРеквизитов(ЭтотОбъект);
КонецПроцедуры
// Конец СтандартныеПодсистемы.Свойства

#КонецОбласти
