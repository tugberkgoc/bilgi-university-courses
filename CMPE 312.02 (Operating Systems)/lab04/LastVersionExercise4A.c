#include <stdio.h>
#include <stdlib.h>

typedef struct student {
 char name[30];
 int age;
 float gpa;
} students;

int main(void) {
 students *my_students;
 int number_of_students, i;
 printf("How many students would you like to record?");
 scanf("%d",&number_of_students);
 my_students = malloc(number_of_students*sizeof(students));
 for(i = 0; i < number_of_students; ++i) {
  printf("Enter first name, age and gpa respectively: ");
  scanf("%s%d%f", (my_students+i)->name, &(my_students+i)->age, &(my_students+i)->gpa);
 }

  for(i=0; i< number_of_students; i++) {
    printf("%d)Name: %s\n", i+1, (my_students+i) -> name);
    printf("%d)Age: %d\n", i+1, (my_students+i) -> age);
    printf("%d)GPA: %f\n", i+1, (my_students+i) -> gpa);
  }

  free(my_students);
  return 0;
}