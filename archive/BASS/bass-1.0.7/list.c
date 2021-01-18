/*

list.c

Author: Liraz Siri <liraz@bigfoot.com>

Copyright (c) 1998 Liraz Siri <liraz@bigfoot.com>, Ariel, Israel,
              All rights reserved.

Created: Wed Dec  2 16:02:42 IST 1998

list type management, structures, and routines.
*/

#include <string.h>
#include "xmalloc.h"
#include "list.h"

/* duplicate object and link it into our list (at the end) */
void list_add(struct list **list_anchor, void *object, int object_len)
{
  struct list **list_link, *list_link_prev;

  /* seek to the end of the list */
  for(list_link = list_anchor, list_link_prev = NULL; *list_link; 
      list_link_prev = *list_link, list_link = &((*list_link)->next));

  *list_link = (struct list *)xmalloc(sizeof(struct list));
  
  (*list_link)->object = xmalloc(object_len);
  (*list_link)->object_len = object_len;

  memcpy((*list_link)->object, object, object_len);
  
  (*list_link)->next = NULL;
  (*list_link)->prev = list_link_prev;
}

/* get object by index (returning NULL if object does not exist) */
void *list_index(struct list **list_anchor, int index)
{
  int i;
  struct list *list_link;
  
  for(i = 0, list_link = *list_anchor; i<index && list_link;
      list_link = list_link->next, i++);

  if(i == index)
    return list_link->object;
      
  return NULL;
}

/* free list, it's objects, memory contents and strucutre */
void list_free(struct list **list_anchor)
{
  struct list *list_link, *next;

  for(list_link = *list_anchor; list_link; list_link = next)
    {
      next = list_link->next;
      xfree(list_link->object);
      xfree(list_link);
    }

 *list_anchor = NULL;
}

/* remove a link from our list (by index) */
void list_remove(struct list **list_anchor, int index)
{
  int i;
  struct list **list_link;

  for(i = 0, list_link = list_anchor; i < index && *list_link;
      list_link = &((*list_link)->next), i++);

  /* obviously the list ended before|when we reached index */
  if(i != index || !*list_link)
    return;
 
  if((*list_link)->prev)
    (*list_link)->prev->next = (*list_link)->next;
  if((*list_link)->next)
    (*list_link)->next->prev = (*list_link)->prev;

  xfree((*list_link)->object);
  xfree(*list_link);

  *list_link = NULL;
}

/* return the length of our list */
int list_len(struct list **list_anchor)
{
  int i;
  struct list *list_link;

  for(i = 0, list_link = *list_anchor; list_link;
      i++, list_link = list_link->next);
  return i;
}
  
  














