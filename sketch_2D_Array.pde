int[][] grid = {{1, 2, 1, 2}, {3, 4, 1, 2}, {2, 1, 3, 4}};
int rows = grid.length;
int cols = grid[0].length;
int w;
int h;
int[] first_select = {-1, -1};
int[] second_select = {-1, -1};
boolean firstClick = true; 

void setup() {
    size(500, 500);
    strokeWeight(7);
    w = width / cols;
    h = height / rows;
    background(255);
}

void draw() {
    int i = 0;
    while (i < rows) {
        int j = 0;
        while (j < cols) {
            noFill();
            stroke(0);
            rect(j*w, i*h, w, h);
            j++;
        }
        i++;
    }
}

void mouseClicked() {
    int col = (mouseX - 25) / w;
    int row = (mouseY - 25) / h;
    checkClick(row, col);
}

void checkClick(int row, int col) {
    int value = grid[row][col];
    if (firstClick) {
        first_select = new int[] {row,col};
        draw_lines(25+col*w, 25+row*h, value);
    } 
    else if (!firstClick) {
        second_select = new int[] {row,col};
        draw_lines(25+col*w, 25+row*h, value);
        
        if (grid[first_select[0]][first_select[1]] == grid[second_select[0]][second_select[1]]) {
            println("Match");
        } else {
          println("Not Match");
        }
    }
    firstClick = !firstClick;
}

void draw_lines(int x, int y, int n) {
    int i = 0;
    while (i < n) {
        line(x+i*20, y, x+i*20, y+40);
        i++;
    }
}
