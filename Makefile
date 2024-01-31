# TODO: Сделать установку нужных библиотек для проекта
# TODO: Добавить debug mode.

# настройка компиляции
CC = gcc
CFLAGS = -Wall -Wextra -Werror -std=c11
GCOV_FLAGS = -fprofile-arcs -ftest-coverage --coverage
DEBUG_FLAGS = -g
FLAGS = $(CFLAGS)
REPORT = 0
SYSTEM_NAME = $(shell uname -s)

# имена
PROJECT_NAME = lea
TEST_NAME = $(PROJECT_NAME)_test
COV_NAME = $(PROJECT_NAME)_coverage

# настройки компиляции от системы
ifeq ($(SYSTEM_NAME), Linux)
	CHECK_FLAGS_LIBS = -pthread -lcheck -pthread -lrt -lm -lsubunit
	S21_MATH_LIB = -L. -l:$(PROJECT_NAME).a
	TERMINAL = open
endif

ifeq ($(SYSTEM_NAME), Darwin)
	CHECK_FLAGS_LIBS = $(shell pkg-config --cflags --libs check)
	S21_MATH_LIB = -L. $(PROJECT_NAME).a
	TERMINAL = xdg-open
endif

# директории
SRC_PATH = ./src/
BUILD_PATH = ./build/
GCOV_PATH = ./gcov/
INCLUDE_PATH = ./include/
BIN_PATH = ./bin/

# файлы
SRC_FILES = $(wildcard $(SRC_PATH)*.c)
BUILD_FILES = $(patsubst $(SRC_PATH)%.c, $(BUILD_PATH)%.o, $(SRC_FILES))

$(BUILD_PATH)%.o: $(SRC_PATH)%.c
	$(CC) $(FLAGS) -c $< -o $@

# устанавливаем нормальный мод
set_normal_mode:
	$(eval FLAG += $(CFLAGS))

# устанавливаем отчетный мод
set_report_mode:
	$(eval CFLAGS += $(GCOV_FLAGS))
	$(eval FLAG += $(CFLAGS))

# устанавливаем debug мод
set_report_mode:
	$(eval CFLAGS += $(DEBUG_FLAGS))
	$(eval FLAG += $(CFLAGS))

# проверяем на стилистику
clang_format_test:
	find . -name "*.c" -o -name "*.h" | xargs clang-format -n -style=Google

# исправляем стилистику
clang_format_run:
	find . -name "*.c" -o -name "*.h" | xargs clang-format -i -style=Google

# очитка от временных файлов
clean:
	rm -rf $(BUILD_PATH)*
	rm -rf $(BIN_PATH)*


# Описание: цель проверяет тест кейсы на утечку памяти
check-memory: clean test
	valgrind --leak-check=full $(BUILD_PATH)$(TEST_NAME) 2>&1 | tee $(BUILD_PATH)/valgrind_output.txt | grep "ERROR SUMMARY:"





