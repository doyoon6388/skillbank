window.onload = ()=>{

}

function changeToPro(a){
    if (a == 1){
        alert('고수 화면으로 전환합니다');
        location.href='/pro/main';
    }else{
        if(prompt('고수 가입 하실?')){
            location.href='/pro/account'
        }
    }



}
function changeToUser(){
    alert('고객 화면으로 전환합니다');
    location.href='/usermode';
}