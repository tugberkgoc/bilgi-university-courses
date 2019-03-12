#include <stdio.h>
#include <stdlib.h>

int main(void) {
  int *ptr, i, size;
  printf("Enter number of elements: \n");
  scanf("%d", &size);
  float sum = 0.0, average;

  printf("Enter elements: \n");

  ptr = malloc(size*sizeof(int));
  for(i=0; i<size; i++) {
    scanf("%d", (ptr+i));
    sum += (int)*(ptr+i);
  }
  average = sum / size;
  printf("Average = %.2f", average);
}