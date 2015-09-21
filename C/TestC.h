/*
 * TestC.h
 *
 *  Created on: 2015. 4. 21.
 *      Author: Lee
 */

#ifndef TESTC_H_
#define TESTC_H_

typedef struct {
	int age;
	char name[2 + 1];
} Human;

typedef struct {
	int year;
	Human *owner;
} Car;

struct Home {
	Human man1;
	Human man2;
};

void func1();
void func2();
void func3(int *p);

void test01();
void test02();
void test03();
void test04();
void test05();
void test06();
void test07();
void test08();
void test09(struct Home *ph);
void test10();
void test11(Car *pc);
void test12();
void test13();

#endif /* TESTC_H_ */
