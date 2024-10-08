int[][] grid = {{1, 2, 1, 3}, {3, 4, 1, 2}, {2, 1, 3, 4}};
int rows = grid.length;
int cols = grid[0].length;
int w;
int h;
boolean click = false;

void setup() {
    size(500, 500);
    strokeWeight(12);
    w = width / cols;
    h = height / rows;
    background(255);
}

void draw() {
  if (click) {
    background(255);
    draw_grid();
  }
}

void draw_grid() {
    int i = 0;
    while (i < rows) {
        int j = 0;
        while (j < cols) {
            draw_lines(25+j*w, 25+i*h, grid[i][j]);
            println(i, j, grid[i][j]);
            j++;
        }
        i++;
    }
}

void draw_lines(int x, int y, int n) {
    int i = 0;
    while (i < n) {
        line(x+i*20, y, x+i*20, y+40);
        i++;
    }
}

void mouseClicked() {
    click = !click;
}
