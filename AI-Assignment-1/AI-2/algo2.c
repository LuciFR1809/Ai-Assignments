#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <limits.h>

int init[3], lstate[3], rstate[3];
FILE *fp,*fp2,*fp3;

char *soldierType[] = {"Red  ", "Blue ", "Green"};

typedef struct node
{
    char type;
    int left[3];
    int right[3];
    int minsteps;
    int beststate;
    struct node *child[3];
} node;

node *newNode()
{
    node *out = (node *)malloc(sizeof(node));
    out->minsteps = -1;
    out->beststate = -1;
    out->child[0] = NULL;
    out->child[1] = NULL;
    out->child[2] = NULL;
    return out;
}

node *root;

int repeat(node *ptr, char c)
{
    if (ptr->type == c && ptr->left[0] == lstate[0] && ptr->left[1] == lstate[1] && ptr->left[2] == lstate[2])
    {
        return 1;
    }
    int i;
    for (i = 0; i < 3; i++)
    {
        if (ptr->child[i] != NULL && repeat(ptr->child[i], c))
        {
            return 1;
        }
    }
    return 0;
}

void printpath(node *ptr)
{
    if (ptr->minsteps == 0)
    {
        return;
    }

    int beststate = ptr->beststate;
    node *bestchild = ptr->child[beststate];

    if (ptr->type == 'L')
    {
        printf("| %s and %s soldiers cross west to east ", soldierType[beststate], soldierType[(beststate + 1) % 3]);
        printf(" || West=[%d, %d, %d]", bestchild->left[0], bestchild->left[1], bestchild->left[2]);
        printf(" || East=[%d, %d, %d] |\n", bestchild->right[0], bestchild->right[1], bestchild->right[2]);

        fprintf(fp, "| %s and %s soldiers cross west to east ", soldierType[beststate], soldierType[(beststate + 1) % 3]);
        fprintf(fp, " || West=[%d, %d, %d]", bestchild->left[0], bestchild->left[1], bestchild->left[2]);
        fprintf(fp, " || East=[%d, %d, %d] |\n", bestchild->right[0], bestchild->right[1], bestchild->right[2]);
        fprintf(fp3, "%d %d %d\n", bestchild->right[0], bestchild->right[1], bestchild->right[2]);
        fprintf(fp2, "%d %d %d\n", bestchild->left[0], bestchild->left[1], bestchild->left[2]);
    }
    else
    {
        printf("| %s soldier crosses east to west          ", soldierType[beststate]);
        printf(" || West=[%d, %d, %d]", bestchild->left[0], bestchild->left[1], bestchild->left[2]);
        printf(" || East=[%d, %d, %d] |\n", bestchild->right[0], bestchild->right[1], bestchild->right[2]);

        fprintf(fp, "| %s soldier crosses east to west          ", soldierType[beststate]);
        fprintf(fp, " || West=[%d, %d, %d]", bestchild->left[0], bestchild->left[1], bestchild->left[2]);
        fprintf(fp, " || East=[%d, %d, %d] |\n", bestchild->right[0], bestchild->right[1], bestchild->right[2]);
        fprintf(fp2, "%d %d %d\n", bestchild->left[0], bestchild->left[1], bestchild->left[2]);
        fprintf(fp3, "%d %d %d\n", bestchild->right[0], bestchild->right[1], bestchild->right[2]);
    }
    printpath(bestchild);
}

void RtoL(node *ptr);

void LtoR(node *ptr)
{
    memcpy(ptr->left, lstate, sizeof(lstate));
    memcpy(ptr->right, rstate, sizeof(rstate));
    ptr->type = 'L';
    if (lstate[0] + lstate[1] + lstate[2] == 0)
    {
        ptr->minsteps = 0;
        return;
    }
    int min_steps = INT_MAX;
    for (int i = 0; i < 3; i++)
    {
        int j = (i + 1) % 3;
        if (lstate[i] > 0 && lstate[j] > 0)
        {
            lstate[i]--;
            lstate[j]--;
            rstate[i]++;
            rstate[j]++;
            if (repeat(root, 'R'))
            {
                rstate[i]--;
                rstate[j]--;
                lstate[i]++;
                lstate[j]++;
                continue;
            }
            ptr->child[i] = newNode();
            RtoL(ptr->child[i]);
            rstate[i]--;
            rstate[j]--;
            lstate[i]++;
            lstate[j]++;

            if (ptr->child[i]->minsteps == -1)
            {
                continue;
            }
            if (ptr->child[i]->minsteps < min_steps)
            {
                min_steps = ptr->child[i]->minsteps;
                ptr->minsteps = 1 + ptr->child[i]->minsteps;
                ptr->beststate = i;
            }
        }
    }
}

void RtoL(node *ptr)
{
    memcpy(ptr->left, lstate, sizeof(lstate));
    memcpy(ptr->right, rstate, sizeof(rstate));
    ptr->type = 'R';
    if (rstate[0] == init[0] && rstate[1] == init[1] && rstate[2] == init[2])
    {
        ptr->minsteps = 0;
        return;
    }
    int min_steps = INT_MAX;
    for (int i = 0; i < 3; i++)
    {
        if (rstate[i] > 0)
        {
            rstate[i]--;
            lstate[i]++;
            if (repeat(root, 'L'))
            {
                lstate[i]--;
                rstate[i]++;
                continue;
            }
            ptr->child[i] = newNode();
            LtoR(ptr->child[i]);
            lstate[i]--;
            rstate[i]++;

            if (ptr->child[i]->minsteps == -1)
            {
                continue;
            }
            if (ptr->child[i]->minsteps < min_steps)
            {
                min_steps = ptr->child[i]->minsteps;
                ptr->minsteps = 1 + ptr->child[i]->minsteps;
                ptr->beststate = i;
            }
        }
    }
}

int main(int argc, char *argv[])
{
    char *a = argv[1];
    init[0] = atoi(a);
    char *b = argv[2];
    init[1] = atoi(b);
    char *c = argv[3];
    init[2] = atoi(c);

    memcpy(lstate, init, sizeof(init));
    memset(rstate, 0, sizeof(rstate));
    printf("\n");
    printf("                         AI-Assignment 1 Q2\n Abhishek Bapna-2018A7PS0184H \n Anirudh Sood-2018A7PS0673H \n Kumar Pranjal-2018A7PS0163H\n");
    fp = fopen("output.txt", "w");
    fp2=fopen("west.txt","w");
    fp3=fopen("east.txt","w");
    printf("\nno. of red   soldiers:%d", init[0]);
    printf("\nno. of blue  soldiers:%d", init[1]);
    printf("\nno. of green soldiers:%d\n", init[2]);
    fprintf(fp, "\nno. of red   soldiers:%d", init[0]);
    fprintf(fp, "\nno. of blue  soldiers:%d", init[1]);
    fprintf(fp, "\nno. of green soldiers:%d\n", init[2]);
    if (init[0] < 0 || init[1] < 0 || init[2] < 0)
    {
        printf("invalid input please try again");
        fprintf(fp, "invalid input please try again");
        return 0;
    }
    root = newNode();
    LtoR(root);
    if (root->minsteps == -1)
    {
        printf("Soldiers can't cross the river\n");
        fprintf(fp, "Soldiers can't cross the river\n");
        return 0;
    }
    printf("Min steps required: %d\n", root->minsteps);
    fprintf(fp, "Min steps required: %d\n", root->minsteps);
    printf(" __________________________________________________________________________________\n");
    printf("|             Movement of Soldiers             || West=[R, B, G] || East=[R, B, G] |\n");
    printf("|----------------------------------------------||----------------||----------------|\n");
    fprintf(fp, " __________________________________________________________________________________\n");
    fprintf(fp, "|             Movement of Soldiers             || West=[R, B, G] || East=[R, B, G] |\n");
    fprintf(fp, "|----------------------------------------------||----------------||----------------|\n");
    printpath(root);
    printf("|______________________________________________||________________||________________|\n");
    fprintf(fp, "|______________________________________________||________________||________________|\n");
     fclose(fp);
    fclose(fp2);
    fclose(fp3);
    return 0;
}