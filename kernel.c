/* This will force us to create a kernel entry function instead of jumping to kernel.c:0x00 */
void dummy_test_entrypoint() {
}

void main() {
    char* video_memory = (char*) 0xb8000;
    int i=160;

    char k_msg[]="---Welcome to FeynOS!---";
    int j=0;
    while(k_msg[j]!='\0')
    {
        video_memory[i]=k_msg[j];i++;
        video_memory[i]=0x0f;i++;
	j++;
	
    }
/*

    video_memory[i]='W';i++;
    video_memory[i]=0x0f;i++;
    video_memory[i]='e';i++;
    video_memory[i]=0x0f;i++;
    video_memory[i]='l';i++;
    video_memory[i]=0x0f;i++;
    video_memory[i]='c';i++;
    video_memory[i]=0x0f;i++;
    video_memory[i]='o';i++;
    video_memory[i]=0x0f;i++;
    video_memory[i]='m';i++;
    video_memory[i]=0x0f;i++;
    video_memory[i]='e';i++;
    video_memory[i]=0x0f;i++;
    video_memory[i]=' ';i++;
    video_memory[i]=0x0f;i++;
    video_memory[i]='T';i++;
    video_memory[i]=0x0f;i++;
    video_memory[i]='o';i++;
    video_memory[i]=0x0f;i++;
    video_memory[i]=' ';i++;
    video_memory[i]=0x0f;i++;
    video_memory[i]='F';i++;
    video_memory[i]=0x0f;i++;
    video_memory[i]='e';i++;
    video_memory[i]=0x0f;i++;
    video_memory[i]='y';i++;
    video_memory[i]=0x0f;i++;
    video_memory[i]='n';i++;
    video_memory[i]=0x0f;i++;
    video_memory[i]='O';i++;
    video_memory[i]=0x0f;i++;
    video_memory[i]='S';i++;
    video_memory[i]=0x0f;i++;

*/
//    for(int i=0;i<100;i++)
//	video_memory[i]='X';
}
