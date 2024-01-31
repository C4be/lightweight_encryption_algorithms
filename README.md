# Легковесные алгоритмы шифрования в протоколе DTLS

Добро пожаловать в репозиторий, посвященный исследованию и реализации легковесных алгоритмов шифрования в контексте Datagram Transport Layer Security (DTLS). Этот проект является частью моей выпускной квалификационной работы (ВКР), направленной на изучение и оптимизацию криптографических методов в рамках DTLS – защищенного протокола передачи данных по сети.

## Оглавление

1. [О проекте](#о-проекте)
2. [Цели проекта](#цели)
3. [TODO (HISTORY)](#todo-history)
4. [Определения](#определения)


## О проекте

**Автор:** 

Гимазетдинов Дмитрий Русланович. 

Университет МАДИ. 

Группа: 4бПМ.

**Научный руководитель:** 

Лебедев Анатолий Николаевич.

### Цели:

1. Изучение легковесных алгоритмов шифрования.
2. Применение их в контексте Datagram Transport Layer Security (DTLS).
3. Сравнение и анализ алгоритмов:
    - Безопасность;
    - Скорость;
    - Простота реализации;
    - Экономическая составляющая.
4. Реализация статической и динамической библиотеки, для удобной интеграции в другие проекты.

### TODO (HISTORY):

- [ ] Изучить теорию и составить:
    - [x] Определения
    - [ ] Список сокращений
    - [ ] Теория и описание алгоритмов
    - [ ] Исследования
    - [ ] Список литературы
- [ ] Программирование:
    - [ ] Структурировать репозиторий.
    - [ ] Написать `Makefile` и задачи:
        - [ ] `build`
        - [ ] `debug`
        - [ ] `test`
        - [ ] `gcov_report`
        - [ ] `clang-format`
        - [ ] `leaks-check`
        - [ ] `cpp-check`
        - [ ] `clean`

## Определения:

1. **Datagram Transport Layer Security (DTLS)** - представляет собой защищенную версию протокола передачи данных по дейтаграммам (UDP), аналогичную тому, как TLS (Transport Layer Security) обеспечивает безопасную передачу данных в протоколе TCP. DTLS был разработан для обеспечения конфиденциальности и целостности данных в условиях ненадежных сетей, где дейтаграммы могут быть потеряны, дублированы или доставлены в неправильном порядке.

2. **UDP (User Datagram Protocol)** - это протокол транспортного уровня, который обеспечивает передачу данных в виде дейтаграмм между приложениями на компьютерах в сети. Он является одним из основных протоколов в стеке интернет-протоколов (TCP/IP) и отличается от TCP тем, что не предоставляет гарантированной доставки данных, контроля порядка или управления потоком. UDP является более "легковесным" и часто используется в приложениях, где небольшая задержка более важна, чем гарантированная доставка.

3. **TLS (Transport Layer Security)** - это протокол транспортного уровня, предназначенный для обеспечения безопасной передачи данных в сети, такой как интернет. Он является эволюцией протокола SSL (Secure Sockets Layer) и обеспечивает шифрование данных, аутентификацию и обеспечение целостности данных. TLS используется в основном в соединениях, где важна конфиденциальность передаваемой информации, таких как защищенные веб-сайты (HTTPS), электронная почта и другие приложения, где важна безопасность данных.

4. **TCP (Transmission Control Protocol)** - это протокол транспортного уровня, предназначенный для обеспечения надежной и упорядоченной передачи данных между узлами в сети. Он обеспечивает гарантированную доставку данных, контроль порядка и управление потоком. TCP является соединительным протоколом, что означает, что передача данных происходит в рамках установленного соединения между отправителем и получателем. TCP широко используется в приложениях, где важна точность передачи данных, таких как веб-серверы, файловые передачи и другие приложения, где потеря данных может быть недопустимой.

5. **Протокол** - это набор правил и соглашений, определяющих способы взаимодействия между устройствами или программами в сети. Он определяет формат и порядок обмена данными, обеспечивая стандартизированный способ коммуникации для различных приложений и устройств.

6. **Дейтаграмма** - это блок данных, который передается в сети как единое сообщение. В контексте протоколов, работающих с дейтаграммами (например, UDP), передача данных осуществляется в виде отдельных пакетов (дейтаграмм), каждый из которых содержит часть информации и может передаваться независимо.

7. **Легковесный алгоритм** - это криптографический алгоритм, который обладает высокой эффективностью и минимальным потреблением ресурсов, такими как вычислительная мощность и память. Такие алгоритмы особенно востребованы в сценариях с ограниченными ресурсами, таких как встроенные системы и устройства IoT.

8. **Шифрование данных** - это процесс преобразования информации (текста или данных) в нечитаемую форму (шифр) с использованием определенного ключа. Это делается для обеспечения конфиденциальности передаваемой информации и защиты от несанкционированного доступа.

9. **Целостность данных** - это свойство данных, гарантирующее, что они не были изменены в процессе передачи или хранения. Механизмы обеспечения целостности данных, такие как хэш-функции, используются для обнаружения любых несанкционированных изменений данных.

10. **Безопасность данных** - набор мер и методов, направленных на обеспечение конфиденциальности, целостности и доступности данных. Это включает в себя использование шифрования, контроль доступа, аутентификацию и другие технологии и практики, направленные на предотвращение несанкционированного доступа и сохранение надежности данных.

11. **Хеш-функция** - это математическая функция, которая принимает входные данные (или сообщение) любой длины и преобразует их в фиксированную строку определенной длины, называемую хеш-значением или хеш-кодом. Хеш-функции широко используются в криптографии и в других областях, таких как проверка целостности данных, создание индексов для ускорения поиска, а также в различных алгоритмах и структурах данных.

12. **IoT (Internet of Things)** - это концепция, описывающая сеть взаимодействующих между собой устройств, объектов и систем, которые снабжены встроенными технологиями для сбора, обмена и обработки данных. Эти устройства могут включать в себя датчики, актуаторы, микроконтроллеры и другие, и они могут взаимодействовать между собой и с центральными системами через сеть, что позволяет собирать и анализировать данные для различных целей. 

<!-- ## Сокращения: -->

<!-- ## Список литературы: -->


