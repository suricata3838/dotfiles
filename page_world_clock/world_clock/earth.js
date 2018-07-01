var container;
var camera;
var scene;
var geometry;
var material;
var mesh;
var renderer;

init();
//animate();

function init() {
    container = document.getElementById('container');
    camera = new THREE.PerspectiveCamera(45, window.innerWidth / window.innerHeight, 1, 1000);
    camera.position.z = 400;

    scene = new THREE.Scene();
    geometry = new THREE.SphereGeometry(150,30,30);
    material = new THREE.MeshBasicMaterial({
        map: THREE.ImageUtils.loadTexture('earth_fin.png')
     });
     mesh = new THREE.Mesh(geometry, material);
     mesh.overdraw = true;
     scene.add(mesh);

     renderer = new THREE.WebGLRenderer();
    renderer.setSize(window.innerWidth, window.innerHeight);
    container.appendChild(renderer.domElement);

}

function animate() {
    requestAnimationFrame(animate);
    render();
}

// マウスの座標を取得し、-1～+1の範囲に正規化する
var mouseX = -1, mouseY = -1;
document.addEventListener('mousemove', function(e) {
  mouseX = (e.clientX / window.innerWidth ) *  2 - 1;
  mouseY = (e.clientY / window.innerHeight) * -2 + 1;
}, false);
 
var baseTime = +new Date;
function render() {
  requestAnimationFrame(render);
 
  // マウスが指した座標に存在するオブジェクトを得る
  var projector = new THREE.Projector();
  var pos = new THREE.Vector3(mouseX, mouseY, -1);
  var ray = projector.pickingRay(pos, camera);
  var intersects = ray.intersectObjects(scene.children);
 
  // マウスがmeshの上にあれば、マテリアルを変更する
  if(intersects.length > 0 && intersects[0].object == mesh) {
    mesh.material.emissive = new THREE.Color(0x888888);
  } else {
    mesh.material.emissive = new THREE.Color(0);
  }
        mesh.rotation.y += 0.005;
        renderer.render(scene, camera);
  
};
render();

