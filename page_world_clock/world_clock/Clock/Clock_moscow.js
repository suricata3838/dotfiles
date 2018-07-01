var ctx, h, m, s,year, month, day;

        function gobj(id){
            return document.getElementById(id);}

        function init(){
            ctx = gobj("clock").getContext("2d");
            setInterval(tick, 1000);
            }
//ここ変える！時差の分ずらす！
var jisa = -6

        function tick(){
            var japan =(new Date()).getTime();
            var now = new Date( japan + jisa*60*60*1000 );
           h = now.getHours() % 12;
           m = now.getMinutes();
           s = now.getSeconds();
           gobj("time").textContent = now.toTimeString();
           paint();
           }

        function drawHand(rotation, length, width, color){
            ctx.save();
            ctx.lineWidth = width;
            ctx.strokeStyle = color;
            ctx.translate(450, 450);
            ctx.rotate(rotation);
             ctx.beginPath();
             ctx.moveTo(0, 0);
             ctx.lineTo(0, -length);
             ctx.stroke();
             ctx.restore();
            }

        function paint() {
                    ctx.clearRect(0, 0, 900, 900);
                    ctx.save();
                    ctx.translate(450, 450);
                    ctx.strokeStyle ="black";
                    var pitch = Math.PI *2/60;
                    for (var i = 0; i<60; i++){
                        ctx.beginPath();
                        ctx.lineWidth = (i %5)== 0 ? 3:1;
                        ctx.moveTo(0, -360);
                        ctx.lineTo(0, -420);
                        ctx.stroke();
                        ctx.rotate(pitch);
                        }

            ctx.restore();

            var radH = (Math.PI *2) /12 *h +  (Math.PI *2) /12 * (m / 60);
            var radM = (Math.PI *2)/60 *m;
            var radS = (Math.PI *2)/60 *s;

            drawHand(radH, 240, 6, "blue")
            drawHand(radM, 360, 4, "blue")
            drawHand(radS, 420, 2, "red")

        }
