import random

def create_board(width):
    return [['-' for _ in range(width)] for _ in range(width)]

def print_board(board):
    for row in board:
        print(' '.join(row))
        
def generate_position(width):
    return random.randint(0, width - 1), random.randint(0, width - 1)

def move_piece(board, piece, position):
    new_board = [row[:] for row in board]
    x, y = position
    new_board[x][y] = piece
    return new_board

def is_winner(position, goals):
    return position in goals

def play_game():
    width = int(input("Masukkan lebar board: "))
    board = create_board(width)
    piece = 'A'
    goals = []

    for _ in range(3):
        try:
            goal = generate_position(width)
            if goal not in goals:
                goals.append(goal)
        except Exception as e:
            print("Gagal mengenerate goal: ", str(e))

    print("Goals: ", goals)
    
    position = generate_position(width)
    
    while True:
        print_board(board)
        print("Posisi saat ini: ", position)
        
        if is_winner(position, goals):
            print("Selamat, Anda menang!")
            break
        
        move = input("Masukkan gerakan (w/a/s/d): ")
        
        if move == 'w':
            new_position = (position[0] - 1, position[1])
        elif move == 'a':
            new_position = (position[0], position[1] - 1)
        elif move == 's':
            new_position = (position[0] + 1, position[1])
        elif move == 'd':
            new_position = (position[0], position[1] + 1)
        else:
            print("Masukan tidak valid. Gunakan w/a/s/d.")
            continue
        
        if 0 <= new_position[0] < width and 0 <= new_position[1] < width:
            board = move_piece(board, '-', position)
            position = new_position
            board = move_piece(board, piece, position)
        else:
            print("Tidak bisa bergerak ke luar board!")

    print_board(board)

if __name__ == "__main__":
    play_game()
