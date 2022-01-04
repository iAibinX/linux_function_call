#include <stdio.h>

void a(){
	c();
}

void b(){

}

void c(){
	d();
}

void d(){

}

int main(){
	a();
	b();
	c();
	return 0;
}
