import socket

HOST = '127.0.0.1'
PORT = 1201

server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

server_socket.bind((HOST, PORT))

server_socket.listen()

client_socket = None
client_address = None

while True:
    try:
        client_socket, client_address = server_socket.accept()
        break
    except Exception:
        continue
    
while True:
    data = client_socket.recv(1024)
    print(data)
    
    if data == "STOP":
        break
    elif data == "something":
        pass # call the function related to 'something'



server_socket.close()
client_socket.close()
