#Defining a Tree
class Node:
    def __init__(self, data):
        self.data = data
        self.left = None
        self.right = None

#Adding a Node
def insert(root, data):
    if root is None:
        return Node(data)
    else:
        if data < root.data:
            root.left = insert(root.left, data)
        else:
            root.right = insert(root.right, data)
    return root

#Building up a Tree
def build_tree(elements):
    root = None
    for element in elements:
        root = insert(root, element)
    return root

#Print all nodes PreOrder
def preorder(node):
    if node is not None:
        print(node.data, end=" ")
        preorder(node.left)
        preorder(node.right)

#Print all nodes InOrder
def inorder(node):
    if node is not None:
        inorder(node.left)
        print(node.data, end=" ")
        inorder(node.right)

#Print all nodes PostOrder
def postorder(node):
    if node is not None:
        postorder(node.left)
        postorder(node.right)
        print(node.data, end=" ")

#Draw Tree
def draw_tree(root):
    print("Binary Tree:")
    print_tree(root, "", True)

#Print Tree
def print_tree(node, prefix, is_left):
    if node is not None:
        print(prefix + ("|-- " if is_left else "`-- ") + str(node.data))
        print_tree(node.left, prefix + ("|   " if is_left else "    "), True)
        print_tree(node.right, prefix + ("|   " if is_left else "    "), False)

#Main
if __name__ == "__main__":
    elements = input("Masukkan Node : ").split()
    tree_root = build_tree(elements)

    print("\nResults:")
    print("Pre-order :")
    preorder(tree_root)

    print("\n\nIn-order :")
    inorder(tree_root)

    print("\n\nPost-order :")
    postorder(tree_root)

    print("\n")
    draw_tree(tree_root)