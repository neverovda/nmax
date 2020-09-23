[![Build Status](https://travis-ci.org/neverovda/nmax.svg?branch=master)](https://travis-ci.org/neverovda/nmax)
[![Coverage Status](https://coveralls.io/repos/github/neverovda/nmax/badge.svg?branch=master)](https://coveralls.io/github/neverovda/nmax?branch=master)

# nmax
Output N maximum numbers from input stream

скрипт nmax, делает следующее: 
* читает из входящего потока текстовые данные
* по завершении ввода выводит n самых больших целых чисел, встретившихся в полученных текстовых данных

Дополнительные указания: 
* числом считается любая непрерывная последовательность цифр в тексте
* известно, что чисел длиннее 1000 цифр во входных данных нет
* число n должно быть единственным параметром скрипта
* код должен быть покрыт тестами
* код должен быть оформлен в виде гема (содержащего исполняемый файл, код модулей и т.д.)
* плюсом является размещение на Github и интеграция с Travis CI
