//ОМ.оду_Клиент

&НаКлиенте
Процедура ОбработкаКомандыУОД_ПоОбъекту(ПараметрКоманды, ПараметрыВыполненияКоманды) 	Экспорт
	
	пр_Форма = пр_Клиент.ИсполняемыйМодуль("оду_Клиент", , пр_НастройкиПовтИсп.ТекущийПользователь());
	Если пр_Форма <> Неопределено Тогда
		пр_Форма.ОбработкаКомандыУОД_ПоОбъекту(ПараметрКоманды, ПараметрыВыполненияКоманды); 
		Возврат;
	КонецЕсли;
	
	Если ПараметрКоманды.Количество() = 0 Тогда
		Возврат;
	КонецЕсли;
	
	ПараметрыРегистрации = оду_Общий.ПараметрыРегистрацииУчастниковОбменаПоТипуОбъекта(ПараметрКоманды, пр_НастройкиПовтИсп.ТекущийПользователь(), Истина);
	МассивУчастниковОбмена = ПараметрыРегистрации.МассивУчастниковОбмена;
											
	Если МассивУчастниковОбмена.Количество() = 1 Тогда
		ЗарегистрироватьОбъектыОбменаСамолет(ПараметрыРегистрации);
	ИначеЕсли МассивУчастниковОбмена.Количество() > 1 Тогда
		
		ОписОповещФормы = Новый ОписаниеОповещения("ПослеВыбораУчатникаОбмена", ЭтотОбъект); //ЭтаФорма, ЭтотОбъект   
		//АдресПараметрыРегистрации = ПоместитьВоВременноеХранилище(ПараметрыРегистрации, УникальныйИдентификатор);
		АдресПараметрыРегистрации = ПоместитьВоВременноеХранилище(ПараметрыРегистрации);
		ПарамФормы = Новый Структура("МассивУчастниковОбмена, АдресПараметрыРегистрации", МассивУчастниковОбмена, АдресПараметрыРегистрации);
		
		//TODO:  
		//Путь = "\\pivo.local\Resource\Личные\Кириллов ПС\r\work\Обработки_оду_пр\С_оду_БазыУчастникиОбмена.epf";
		//пр_Клиент.ОткрытьФормуВнешнейОбработки(Путь, "ФормаВыбораУчастникаОбмена", ПарамФормы, , , , , ОписОповещФормы);
		
		ОткрытьФорму("Справочник.оду_БазыУчастникиОбмена.Форма.ФормаВыбораУчастникаОбмена", ПарамФормы,,,,, ОписОповещФормы, РежимОткрытияОкнаФормы.БлокироватьОкноВладельца); 

	КонецЕсли; 
	
КонецПроцедуры


#Область  УОД_Самолет

&НаКлиенте
Процедура ПослеВыбораУчатникаОбмена(ПараметрыВыбора, Параметры) Экспорт
	
	Если ПараметрыВыбора = Неопределено Тогда
		Возврат;	
	КонецЕсли; 
	
	МассивВыбраныхУО = ПараметрыВыбора.МассивУчастниковОбмена;
	Если МассивВыбраныхУО = Неопределено Тогда
		Возврат;	
	КонецЕсли; 
	
	АдресПараметрыРегистрации = ПараметрыВыбора.АдресПараметрыРегистрации;
	ПараметрыРегистрации = ПолучитьИзВременногоХранилища(АдресПараметрыРегистрации);
	
	МассивУчастниковОбмена = ПараметрыРегистрации.МассивУчастниковОбмена;
	
	Инд = МассивУчастниковОбмена.ВГраница();
	
	Пока Инд >= 0 Цикл
		
		ЭлМас = МассивУчастниковОбмена[Инд];
		
		НайдСтрока = МассивВыбраныхУО.Найти(ЭлМас.БазаПриемник);
		Если НайдСтрока = Неопределено Тогда
			МассивУчастниковОбмена.Удалить(Инд);	
		КонецЕсли; 	
	
		Инд = Инд - 1;		
	
	КонецЦикла; 
	
	ЗарегистрироватьОбъектыОбменаСамолет(ПараметрыРегистрации);

КонецПроцедуры 

&НаКлиенте
Процедура ЗарегистрироватьОбъектыОбменаСамолет(ПараметрыРегистрации)
	
	РезультатРегистрации = оду_Общий.РезультатРегистрацииОбъектовОбменаСамолет(ПараметрыРегистрации);
	Если РезультатРегистрации = Истина Тогда
		оду_Общий.ВыполнитьОбменВФоне(оду_ОбщийПовтИсп.РежимВыгрузка(), 2);
	КонецЕсли;	
	
КонецПроцедуры

#КонецОбласти

// ОМ.оду_Клиент