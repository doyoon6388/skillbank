window.onload = () => {
 insertProduct();
}

function insertProduct() {
       const nameEl = document.querySelector("#name");
       const priceEl = document.querySelector("input[name='p_price']");
       const addBtn = document.querySelector("#add");
       console.log(nameEl);
       console.log(priceEl);
       console.log(addBtn);

       addBtn.addEventListener("click", () => {
const obj = {
       p_name : nameEl.value,
       p_price : priceEl.value
};
       console.log(obj);
       console.log(JSON.stringify(obj));

              fetch('/products/api/product', {
                     method : "post",
                     headers : {
                            'Content-Type' : 'application/json'
                     },
                     body : JSON.stringify(obj)
              }).then(response => {
                     console.log(response);
                     nameEl.value = "";
                     priceEl.value = "";

              })

       })


}
fetch("/aa.jsp").then(response => response.text()).then(data => {
       console.log(data)
       document.querySelector("#content").innerHTML = data;
})