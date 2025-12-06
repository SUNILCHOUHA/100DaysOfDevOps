resource "local_file" "txtfile" {
    filename = "fistterra.txt"
    content = var.filecontent #"This is my first terraform file"
}