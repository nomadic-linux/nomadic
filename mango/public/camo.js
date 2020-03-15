var canvas = document.getElementById("camo"); var ctx = canvas.getContext("2d"); var $canvas = $("#camo"); var canvasOffset = $canvas.offset(); var offsetX = canvasOffset.left; var offsetY = canvasOffset.top;
ctx.strokeStyle = 'red'; ctx.lineWidth = 3; var cw = canvas.width; var ch = canvas.height; var cols = 25; var rows = 25; var padding = 0; var w = (cw - padding * cols) / cols; var h = (ch - padding * rows) / rows;
var zoom = 1.00; var scalePtX, scalePtY; var colors = [];
for (var y = 0; y < rows; y++) { for (var x = 0; x < cols; x++) { colors.push(randomColor()); } }
function draw() { ctx.clearRect(0, 0, cw, ch); ctx.save(); ctx.translate(scalePtX - scalePtX * zoom, scalePtY - scalePtY * zoom); ctx.scale(zoom, zoom); ctx.globalAlpha = 0.75;
  for (var y = 0; y < rows; y++) { for (var x = 0; x < cols; x++) { ctx.fillStyle = colors[y * cols + x]; ctx.fillRect(x * (w + padding), y * (h + padding), w, h); } }
  ctx.globalAlpha = 1.00; ctx.beginPath(); ctx.arc(scalePtX, scalePtY, 10, 0, Math.PI * 2); ctx.closePath(); ctx.stroke(); ctx.restore(); }
function randomColor() { var colors = ['333333', '000000', '666666', '999999']; var g = colors[Math.floor(Math.random() * colors.length)]; return ('#' + g); }
$canvas.attr("height", document.window.height); $canvas.attr("width", document.window.width); draw();