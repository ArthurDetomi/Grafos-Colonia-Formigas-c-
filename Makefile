CXX = g++
CXXFLAGS = -Wall -Wextra -std=c++11
SRC_DIR = ./
OBJ_DIR = ./obj
INP_DIR = input

all: $(OBJ_DIR)/colonia_formigas

$(OBJ_DIR)/colonia_formigas: $(SRC_DIR)/colonia_formigas.cpp
	$(CXX) $(CXXFLAGS) -o $@ $^

rodar_programa: $(OBJ_DIR)/colonia_formigas
	./$^ < $(INP_DIR)/teste.txt

rodar_programa_saida_arquivo: $(OBJ_DIR)/colonia_formigas
	./$^ < $(INP_DIR)/teste.txt > output/out.txt

clean:
	rm -f $(OBJ_DIR)/colonia_formigas

.PHONY: all clean
