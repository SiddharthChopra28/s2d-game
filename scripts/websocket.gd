extends Node

var ws = WebSocketPeer.new()
var connected = false

func _ready():
	var err = ws.connect_to_url("ws://127.0.0.1:1201")  # Replace with your WebSocket server URL
	if err != OK:
		print("Failed to connect to WebSocket server!")
	else:
		print("Connecting...")

func _process(delta):
	ws.poll()  # Process WebSocket events
	var state = ws.get_ready_state()
	
	if state == WebSocketPeer.STATE_OPEN and not connected:
		_on_connected()
	elif state == WebSocketPeer.STATE_CLOSING or state == WebSocketPeer.STATE_CLOSED:
		_on_disconnected()
	
	while ws.get_available_packet_count() > 0:
		_on_data()

func _on_connected():
	print("Connected to WebSocket server!")
	connected = true
	ws.send_text("Hello, Server!")  # Send a message to the server

func _on_data():
	var message = ws.get_packet().get_string_from_utf8()
	print("Received message:", message)

func _on_disconnected():
	print("Disconnected from WebSocket server!")
	connected = false
