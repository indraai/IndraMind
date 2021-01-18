/*

list.c

Author: Liraz Siri <liraz@bigfoot.com>

Copyright (c) 1998 Liraz Siri <liraz@bigfoot.com>, Ariel, Israel,
              All rights reserved.

Created: Wed Dec  2 16:02:42 IST 1998

list type management, structures, and routines.
*/

struct list {
 void *object;
 int object_len;
 struct list *next, *prev;
};

/* duplicate object and link it into our list (at the end) */
void list_add(struct list **list_anchor, void *object, int object_len);

/* get object by index (returning NULL if object does not exist) */
void *list_index(struct list **list_anchor, int index);

/* free list, it's objects, memory contents and strucutre */
void list_free(struct list **list_anchor);

/* remove a link from our list (by index) */
void list_remove(struct list **list_anchor, int index);

/* return the length of our list */
int list_len(struct list **list_anchor);
  
  














