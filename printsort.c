
/* Jack Herberger and Tyler Baxter */
#include <stdio.h>

int main()
{
	char c;
	int idx;
	int i;
	int m;
	int n;
	int index;
	char min;

	char arr[20] = {'\0', '\0', '\0', '\0', '\0', 
					'\0', '\0', '\0', '\0', '\0',
					'\0', '\0', '\0', '\0', '\0',
					'\0', '\0', '\0', '\0', '\0'};
	int rep_cnt = 0;
	while(1 == 1)
	{
		printf("Enter word: ");
		c = 'a';
		idx = 0;
		while (c != 0x0A)
		{
			c = getchar();
			arr[idx] = c;
			idx++;
			rep_cnt += 1;
		}

		if (arr[0] == 0x0A){
			printf("\n");
			printf("Exiting \n");
			return 0;
		}
		
		printf("%s", "Original word: ");

		i = 0;
		while (arr[i] != '\0'){
			if (arr[i] != '~') {
				printf("%c", arr[i]);
			}
			i++;
		}

		printf("%s", "Alphabetized word: ");

		n = 0;
		index = 0;
		for (i = 0; i < rep_cnt; i++)
		{
			min = 'z';
			m = 0;
			while (arr[m] != '\0')
			{
				if (arr[m] < min)
				{
					min = arr[m];
					index = m;
				}
				m++;
			}
			n++;
			if (arr[index] >= '0' && arr[index] != '~')
			{
				printf("%c", arr[index]);
			}
			arr[index] = '~';
		}
		printf("\n");
	}
}
