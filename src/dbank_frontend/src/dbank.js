import { dbank_backend } from "../../declarations/dbank_backend";

window.addEventListener("load", async () => {
    const currentAmount = await dbank_backend.getBalance();
    document.getElementById("value").innerText = currentAmount.toFixed(2);


    document.getElementById("submit-btn").addEventListener("click", async (e) => {
        e.preventDefault();

        const button = document.getElementById("submit-btn");
        const inputAmountButton = document.getElementById("input-amount");
        const withdrawalAmountButton = document.getElementById("withdrawal-amount");

        button.disabled = true;

        const topUpAmount = parseFloat(document.getElementById("input-amount").value);
        const withdrawalAmount = parseFloat(document.getElementById("withdrawal-amount").value);

        if (!isNaN(topUpAmount)) {
            await dbank_backend.deposit(topUpAmount);
        }
        if (!isNaN(withdrawalAmount)) {
            await dbank_backend.withdraw(withdrawalAmount);
        }
        const currentAmount = await dbank_backend.getBalance();
        document.getElementById("value").innerText = currentAmount.toFixed(2);

        inputAmountButton.value = "";
        withdrawalAmountButton.value = "";
        button.disabled = false;
    });
});
