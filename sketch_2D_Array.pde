int[][] grid = {{1, 2, 1, 3}, {2, 4, 1, 2}, {2, 1, 3, 4}};
int rows = grid.length;
int cols = grid[0].length;
int w;
int h;
int[] first_select = {-1, -1};
int[] second_select = {-1, -1};
boolean firstClick = true; 
boolean[][] matched = new boolean[rows][cols];
boolean gamewin = false;

void setup() {
    size(500, 500);
    strokeWeight(7);
    w = width / cols;
    h = height / rows;
    background(255);
}

void draw() {
    if (gamewin) {
        background(255);
        textSize(32);
        fill(0);
        text("Winner !!", width / 2 - 50, height / 2);
        return;
    }

    int i = 0;
    while (i < rows) {
        int j = 0;
        while (j < cols) {
            noFill();
            stroke(0);
            rect(j * w, i * h, w, h);
            
            if (matched[i][j]) {
                correctbg(i, j);
                int value = grid[i][j];
                draw_lines(25 + j * w, 25 + i * h, value);
            }
            j++;
        }
        i++;
    }
}

void mouseClicked() {
    if (gamewin) {
        return;
    }
    
    int col = (mouseX - 25) / w;
    int row = (mouseY - 25) / h;
    
    if (!matched[row][col]) {
        checkClick(row, col);
    }
}

void checkClick(int row, int col) {
    int value = grid[row][col];
    if (firstClick) {
        first_select = new int[] {row,col};
        draw_lines(25+col*w, 25+row*h, value);
    } 
    else {
        second_select = new int[] {row,col};
        draw_lines(25+col*w, 25+row*h, value);
        
        if (grid[first_select[0]][first_select[1]] == grid[second_select[0]][second_select[1]]) {
            println("Match");
            matched[first_select[0]][first_select[1]] = true;
            matched[second_select[0]][second_select[1]] = true;
            correctbg(first_select[0], first_select[1]);
            correctbg(second_select[0], second_select[1]);
            checkWin();
        } else {
            println("Not Match");
            delay(3000);
            reset_clicked();
        }
    }
    firstClick = !firstClick;
}

void checkWin() {
    for (int i = 0; i < rows; i++) {
        for (int j = 0; j < cols; j++) {
            if (!matched[i][j]) {
                return;
            }
        }
    }
    gamewin = true;
}

void correctbg(int row, int col) {
    fill(0, 255, 0);
    noStroke(); 
    rect(col*w, row*h, w, h);
    stroke(0);
}

void reset_clicked() {
    background(255);
    draw();
}

void draw_lines(int x, int y, int n) {
    int i = 0;
    while (i < n) {
        line(x+i*20, y, x+i*20, y+40);
        i++;
    }
}
