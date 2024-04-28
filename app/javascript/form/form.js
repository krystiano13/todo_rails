const createForm = document.querySelector("#create");
const editForm = document.querySelector("#edit");
const cancelButton = document.querySelector("#cancel");
const tasks = document.querySelectorAll(".task");

let edit = false;

function toggleForms() {
    if(edit) {
        editForm.classList.remove("hidden");
        createForm.classList.add("hidden");
    }
    else {
        editForm.classList.add("hidden");
        createForm.classList.remove("hidden");
    }
}

cancelButton.addEventListener("click",() => {
    edit = false;
    toggleForms();
})

tasks.forEach(item => {
    item.addEventListener("click", () => {
        edit = true;
        editForm.querySelector('form').action = `/tasks/edit/${item.id}`;
        toggleForms();
    });
});