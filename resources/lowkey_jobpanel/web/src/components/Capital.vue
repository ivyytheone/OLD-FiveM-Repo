<template>
    <v-card class="ma-5" color="secondary">
        <v-card-title>Företagets kapital</v-card-title>

        <v-card-text>Kapital: {{ Intl.NumberFormat("sv-SE", { style: "currency", currency: "SEK", }).format(jobData.balance) }}</v-card-text>
    </v-card>

    <v-card class="ma-5" color="secondary" :elevation="2">
        <v-card-title style="display: flex; justify-content: space-between; align-items: center;">
            <div>
                <span>Hantera ekonomi</span>
            </div>
        </v-card-title>

        <v-divider></v-divider>

        <v-card-text>
            <v-text-field density="compact" variant="outlined" label="Ange summa" v-model="amount"></v-text-field>
        </v-card-text>

        <v-divider></v-divider>

        <v-card-actions>
            <v-btn text @click="changeCapital('deposit')">Sätt in</v-btn>
            <v-btn text @click="changeCapital('withdraw')">Ta ut</v-btn>
        </v-card-actions>
    </v-card>
</template>

<script>
    export default {
        name: 'Employees',

        props: ['jobData'],

        data: () => ({
            amount: ''
        }),    

        methods: {
            changeCapital(type) {
                const amount = document.querySelector('input').value;

                if (type == 'withdraw' && amount > this.jobData.balance) {
                    return;
                }

                if (type == 'deposit' && amount < 0) {
                    return;
                }  

                if (amount.length > 0 && !isNaN(amount) && !this.amount == '') {
                    this.$emit('sendMessage', 'changeCapital', { type: type, amount: amount, job: this.jobData.job }, (response) => {
                        if (response) {
                            this.amount = '';

                            if (type == 'deposit') {
                                this.jobData.balance += parseInt(amount);
                            } else {
                                this.jobData.balance -= parseInt(amount);
                            }
                        }
                    })
                }
            }
        }
    }
</script>