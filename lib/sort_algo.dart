class Node {
  int data;
  Node? prev, next;

  Node(this.data);
}

class DoublyLinkedList {
  Node? head;

  DoublyLinkedList();

  // Function to insert a node at the end of the doubly linked list
  void append(int data) {
    Node newNode = Node(data);
    if (head == null) {
      head = newNode;
    } else {
      Node lastNode = head!;
      while (lastNode.next != null) {
        lastNode = lastNode.next!;
      }
      lastNode.next = newNode;
      newNode.prev = lastNode;
    }
  }

  // Function to print the doubly linked list
  List<int> printList() {
    Node? temp = head;
    List<int> list = [];
    while (temp != null) {
      list.add(temp.data);
      temp = temp.next;
    }

    return list;
  }

  // Function to merge two sorted doubly linked lists
  Node? merge(Node? left, Node? right) {
    if (left == null) return right;
    if (right == null) return left;

    if (left.data < right.data) {
      left.next = merge(left.next, right);
      left.next?.prev = left;
      left.prev = null;
      return left;
    } else {
      right.next = merge(left, right.next);
      right.next?.prev = right;
      right.prev = null;
      return right;
    }
  }

  // Function to perform merge sort on the doubly linked list
  Node? mergeSort(Node? start) {
    if (start == null || start.next == null) {
      return start;
    }

    Node? middle = getMiddle(start);
    Node? nextToMiddle = middle!.next;
    middle.next = null;

    Node? left = mergeSort(start);
    Node? right = mergeSort(nextToMiddle);

    return merge(left, right);
  }

  // Function to get the middle of the doubly linked list
  Node? getMiddle(Node? start) {
    if (start == null) return null;

    Node slow = start, fast = start;

    while (fast.next != null && fast.next!.next != null) {
      slow = slow.next!;
      fast = fast.next!.next!;
    }

    return slow;
  }

  // Function to start the merge sort process
  void mergeSortList() {
    head = mergeSort(head);
  }
}
