/*
 ============================================================================
 Name        : TestC.c
 Author      : 
 Version     :
 Copyright   : Your copyright notice
 Description : Hello World in C, Ansi-style
 ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "TestC.h"

int main(void) {
	//puts("!!!Hello World!!!"); /* prints !!!Hello World!!! */
	test01();




	return EXIT_SUCCESS;
}

void test13() {

	char str1[2 + 1] = "03";
	char str2[10] = "02";
	printf("strcmp(str1,str2) : %d\n", strcmp(str1, str2));
	printf("strncmp(str1,str2,2) : %d\n", strncmp(str1, str2, 2));

	printf("strcat(str2, str1) : %s\n", strcat(str2, str1));
	printf("strcat(str2, str1) : %s\n", strncat(str2, str1, 2));

	long i = 1065;

	itoa(i, str1, 2);
	printf("itoa : %s\n", str1);

}

/**
 * 구조체 배열
 */
void test12() {

	int size = 5;
	int i;

	Car *pc = (Car *) malloc(sizeof(Car) * size);
	memset(pc, 0x00, sizeof(Car) * size);

	for (i = 0; i < size; i++) {
		//printf("%d loop.\n", (i+1));
		pc[i].year = 2000 + i;

		Human *ph = (Human *) malloc(sizeof(ph));
		memset(ph, 0x00, sizeof(Human));
		pc[i].owner = ph;

		ph->age = 20 + i;

		char ch[20];
		sprintf(ch, "20%d", i);

		strcpy(ph->name, ch);

	}

	for (i = 0; i < size; i++) {
		printf("%d loop. year:%d. age:%d, name:%s\n", (i + 1), pc[i].year,
				pc[i].owner->age, pc[i].owner->name);
	}



free(pc);
}

void test10() {

	Car *pc = (Car *) malloc(sizeof(Car));
	memset(pc, 0x00, sizeof(Car));
	printf("Car size : %d\n", sizeof(Car));

	test11(pc);

	printf("c.owner->name : %s\n", pc->owner->name);
	printf("c.owner->age : %d\n", pc->owner->age);

}

void test11(Car *pc) {

	Human *ph = (Human *) malloc(sizeof(Human));
	memset(ph, 0x00, sizeof(Human));

	pc->owner = ph;

	ph->age = 10;
	strcpy(ph->name, "ab");
}

void test09(struct Home *ph) {
	ph->man1.age = 11;
//printf("in man1.age : %d\n", h.man1.age);
}

void test08() {
	struct Home h;
	h.man1.age = 10;
	printf("man1.age : %d\n", h.man1.age);
	test09(&h);
	printf("man1.age : %d\n", h.man1.age);

	Car cc;
	cc.year = 1996;
	printf("cc.year : %d\n", cc.year);

}

void test07() {

	struct Home h;
	struct Home *ph;
	ph = &h;
	ph->man1.age = 10;

	printf("man1.age : %d\n", h.man1.age);

}

void test06() {

	Human man;
	Human *pman;

	pman = &man;

//man.name = "abcd";
	strcpy(pman->name, "abcd");

	printf("name : %s\n", man.name);
	printf("name : %s\n", pman->name);

	strcpy(pman->name, "abced");

	printf("name : %s\n", man.name);
	printf("name : %s\n", pman->name);
}

void test05() {

	int n = 10;
	func3(&n);
	printf("result : %d\n", n);

	int arr[3] = { 1, 3, 5 };
	func3(&arr[1]);
	printf("result : %d\n", arr[1]);
}

void func3(int *p) {
	*p = *p + 1;
}

void test04() {
	char str1[] = "abcdef";

	char str2[10];

	strcpy(str2, str1);
	printf("str2 : %s\n", str2);
}

void func1() {
	printf("func1\n");
}

void func2(int temp) {
	printf("func2 : %d\n", temp);
}

void test03() {

	void (*p1)(int temp);

	p1 = func2;

	p1(32);
//printf("func1 : %x\n", func1);
}

void test02() {

	puts("### test02 ###");

	int a = 10;
	int *p = &a;
	int b = a;

	printf("int a  : %d\n", a);
	printf("int* p : %d\n", *p);
	printf("int b : %d\n", b);

	*p = 20;

	puts("================================");
	printf("int a  : %d\n", a);
	printf("int* p : %d\n", *p);
	printf("int b : %d\n", b);

}

void test01() {
	puts("### test01 ###");

	int a = 10;
	printf("A : %d\n", ++a);

	char cc = 'b';
	printf("char : %c\n", cc);

	int* pp = &a;
	printf("int pointer : %p\n", pp);
	printf("int value : %d\n", (*pp + 10));
	printf("int value : %d\n", *pp);

	char str[] = "Jaemun Lee";
	printf("String value : %s\n", str);

	int n_arr[] = { 3, 4, 56 };

	printf("array size : %d\n", sizeof(n_arr) / sizeof(n_arr[0]));
	printf("array size : %d\n", *(n_arr + 2));
}
