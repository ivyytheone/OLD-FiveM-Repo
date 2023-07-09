<template>
    <div>
        <v-card color="secondary" :elevation="2" class="ma-5">
            <v-card-title>Företagsets översikt</v-card-title>

            <v-divider></v-divider>

            <v-card-text>
                <v-container>
                    <v-row>
                        <v-col cols="12" sm="6" md="5.3">
                            <v-card outlined color="accent" :elevation="0">
                                <v-card-title>
                                    <span style="font-size: 23px">
                                        Antal anställda
                                    </span>
                                </v-card-title>

                                <v-card-text>
                                    <span style="font-size: 23px">
                                        {{ jobData.employees ? jobData.employees.length : 0 }} st
                                    </span>
                                </v-card-text>
                            </v-card>
                        </v-col>

                        <v-col cols="12" sm="6" md="5.3">
                            <v-card outlined color="accent" :elevation="0">
                                <v-card-title>
                                    <span style="font-size: 23px">
                                        Kapital
                                    </span>
                                </v-card-title>

                                <v-card-text>
                                    <span style="font-size: 23px">
                                        {{ Intl.NumberFormat("sv-SE", { style: "currency", currency: "SEK", }).format(jobData.balance) }}
                                    </span>
                                </v-card-text>
                            </v-card>
                        </v-col>
                    </v-row>
                </v-container>
            </v-card-text>
        </v-card>

        <v-card class="ma-5" color="secondary" :elevation="2">
            <v-card-title>Företagsets anställda</v-card-title>

            <v-divider></v-divider>

            <v-card-text>
                <v-list lines="one" bg-color="accent" style="max-height: 40vh; overflow-y: scroll;">
                    <v-list-item
                        v-for="item in jobData.employees"
                        :key="item.socialnumber"
                        :title="item.firstname + ' ' + item.lastname"
                        :subtitle="'Rank' + ' ' + item.job_grade + ' ' + '•' + ' ' + item.id"
                    ></v-list-item>
                </v-list>
            </v-card-text>
        </v-card>
    </div>
</template> 

<script>
    export default {
        name: 'App',

        props: ['jobData'], 

        data: () => ({

        }),     

        methods: {

        }, 

        computed: {

        }, 
    }
</script>

<style>
    ::-webkit-scrollbar {
        display: none;
    }
</style>