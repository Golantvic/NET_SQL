print('\nЗадание 1')

# Дан список. Напишите функцию, которая возвращает сумму элементов по диагонали. Т. е. 13+32+23+35.

data = [
    [13, 25, 23, 34],
    [45, 32, 44, 47],
    [12, 33, 23, 95],
    [13, 53, 34, 35],
]

def diagonal_sum (array):
    diagonal_sum = 0
    for i in range(0, len(array)):
        diagonal_sum += array[i][i]
    return diagonal_sum

print(diagonal_sum(data))
print('Проверка: Т. е. 13+32+23+35 =', 13+32+23+35)


print('\nЗадание 2')
# Дан список чисел, часть из которых имеют строковый тип или содержат буквы. Напишите функцию, которая возвращает сумму квадратов элементов, которые могут быть числами.

data = [1, '5', 'abc', 20, '2']

def number_check(data):
    total_sum = 0
    for i in data:
       try:
           total_sum += float(i)**2
       except:
           print('Не числовой элемент: {}'.format(i))
    return total_sum

print(number_check(data))


print('\nЗадание 3')
# Напишите функцию, которая возвращает название валюты (поле ‘Name’) с максимальным значением курса с помощью сервиса https://www.cbr-xml-daily.ru/daily_json.js

import requests

class Rate:
    def __init__(self, format='value'):
        self.format = format

    def exchange_rates(self):
        """
        Возвращает ответ сервиса с информацией о валютах в виде:

        {
            'AMD': {
                'CharCode': 'AMD',
                'ID': 'R01060',
                'Name': 'Армянских драмов',
                'Nominal': 100,
                'NumCode': '051',
                'Previous': 14.103,
                'Value': 14.0879
                },
            ...
        }
        """
        r = requests.get('https://www.cbr-xml-daily.ru/daily_json.js')
        return r.json()['Valute']

    def make_format(self, currency):
        """
        Возвращает информацию о валюте currency в двух вариантах:
        - полная информация о валюте при self.format = 'full':
        Rate('full').make_format('EUR')
        {
            'CharCode': 'EUR',
            'ID': 'R01239',
            'Name': 'Евро',
            'Nominal': 1,
            'NumCode': '978',
            'Previous': 79.6765,
            'Value': 79.4966
        }

        Rate('value').make_format('EUR')
        79.4966
        """
        response = self.exchange_rates()

        if currency in response:
            if self.format == 'full':
                return response[currency]

            if self.format == 'value':
                return response[currency]['Value']

        return 'Error'

    def eur(self):
        """Возвращает курс евро на сегодня в формате self.format"""
        return self.make_format('EUR')

    def usd(self):
        """Возвращает курс доллара на сегодня в формате self.format"""
        return self.make_format('USD')


print(sorted(Rate().exchange_rates().items(), key = lambda x: -x[1]['Value'] / x[1]['Nominal']) )


print('\nЗадание 4')
# Добавьте в класс параметр diff (со значениями True или False), который в случае значения True в методах eur и usd будет возвращать не курс валюты, а изменение по сравнению в прошлым значением.

class Rate:
    def __init__(self, format='value', diff=False):
        self.format = format
        self.diff = diff

    def exchange_rates(self):
        """
        Возвращает ответ сервиса с информацией о валютах в виде:

        {
            'AMD': {
                'CharCode': 'AMD',
                'ID': 'R01060',
                'Name': 'Армянских драмов',
                'Nominal': 100,
                'NumCode': '051',
                'Previous': 14.103,
                'Value': 14.0879
                },
            ...
        }
        """
        r = requests.get('https://www.cbr-xml-daily.ru/daily_json.js')
        return r.json()['Valute']

    def make_format(self, currency):
        """
        Возвращает информацию о валюте currency в двух вариантах:
        - полная информация о валюте при self.format = 'full':
        Rate('full').make_format('EUR')
        {
            'CharCode': 'EUR',
            'ID': 'R01239',
            'Name': 'Евро',
            'Nominal': 1,
            'NumCode': '978',
            'Previous': 79.6765,
            'Value': 79.4966
        }

        Rate('value').make_format('EUR')
        79.4966
        """
        response = self.exchange_rates()

        if currency in response:
            if self.format == 'full':
                return response[currency]

            if self.format == 'value':
                if self.diff:
                    return response[currency]['Value'] - response[currency]['Previous']
                else:
                    return response[currency]['Value']

        return 'Error'

    def eur(self):
        """Возвращает курс евро на сегодня в формате self.format"""
        return self.make_format('EUR')

    def usd(self):
        """Возвращает курс доллара на сегодня в формате self.format"""
        return self.make_format('USD')

print(Rate(diff=True).usd())



print('\nЗадание 5')
# Напишите функцию, возвращающую сумму первых n чисел Фибоначчи

def fibonacci(n):
    if n in (1, 2):
        return 1
    return fibonacci(n - 1) + fibonacci(n - 2)

print(fibonacci(6))


print('\nЗадание 6')
# Напишите функцию, преобразующую произвольный список вида [‘2018-01-01’, ‘yandex’, ‘cpc’, 100] в словарь {‘2018-01-01’: {‘yandex’: {‘cpc’: 100}}}

a = ['2018-01-01', 'yandex', 'cpc', 100]

def recursion_dict(a):
    if len(a) > 2:
        return {a[0]: recursion_dict(a[1:])}
    else:
        return {a[0]: a[1]}

print(recursion_dict(a))
