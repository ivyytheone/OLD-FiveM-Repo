<template>
    <v-app v-if="display" style="background: transparent">
        <div style="display: flex; justify-content: center; align-items: center; height: 100vh;">
            <v-card width="970" height="800" color="primary">
                <v-card-title style="display: flex; justify-content: space-between; align-items: center;">
                    <div>
                        <v-avatar :image="jobData.image" />
                        <span class="ma-3">{{ jobData.name }}</span>
                    </div>

                    <v-tabs v-model="value">
                        <v-tab value="overview">Översikt</v-tab>
                        <v-tab value="employees">Anställda</v-tab>
                        <v-tab value="capital">Ekonomi</v-tab>
                    </v-tabs>
                </v-card-title>

                <v-divider></v-divider>

                <v-card-text>
                    <v-window v-model="value">
                        <v-window-item value="overview">
                            <Overview :jobData="jobData" @sendMessage="sendMessage"/>
                        </v-window-item>

                        <v-window-item value="employees">
                            <Employees :jobData="jobData" :ranks="ranks" @updatePlayer="updatePlayer" @sendMessage="sendMessage"/>
                        </v-window-item>

                        <v-window-item value="capital">
                            <Capital :jobData="jobData" @sendMessage="sendMessage"/>
                        </v-window-item>
                    </v-window>
                </v-card-text>
            </v-card>
        </div>
    </v-app>
</template> 

<script>
    import Overview from './components/Overview.vue'; 
    import Employees from './components/Employees.vue';
    import Capital from './components/Capital.vue'; 

    export default {
        name: 'App',

        components: {
            Overview, 
            Employees, 
            Capital
        },

        data() {
            return {
                display: false, 
                value: null,

                hasInvoice: false, 

                ranks: [], 

                jobData: {
                    // name: 'Polismyndigheten', 
                    // image: 'https://cdn.discordapp.com/attachments/847581646677082192/1071075554926809098/image.png', 

                    // balance: 300, 

                    // employees: [
                    //     {
                    //         firstname: 'John',
                    //         lastname: 'Doe',
                    //         socialnumber: '1993-04-12-7890',
                    //         rank: 4, 
                    //         salary: 1000, 
                    //     }, 
                    // ]
                }
            }
        },

        methods: {
            updatePlayer(player) {
                const index = this.jobData.employees.findIndex((employee) => employee.identifier == player.id);

                console.log('Dinpappa ' + JSON.stringify(index))

                if (index) {
                    this.jobData.employees[index].hasAccess = player.hasAccess;
                    this.jobData.employees[index].job_grade = player.job_grade.value;
                }
            }, 

            sendMessage(event, data, callback) {
                fetch(`https://lowkey_jobpanel/${event}`, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json; charset=UTF-8',
                    },
                    body: JSON.stringify(data ? data : [])
                }).then(resp => resp.json()).then(resp => callback(resp));
            }, 

            close() {
                this.jobData = {
                    name: null, 
                    image: null, 

                    balance: null, 

                    employees: []
                };

                this.sendMessage('close', {}, (response) => {
                    this.display = false;  
                })
            }, 
        }, 

        mounted() {
            this.eventListener = window.addEventListener('message', (event) => {
                const eventData = event.data;

                if (eventData.event == 'open') {
                    this.display = true; 

                    this.jobData = {
                        job: eventData.data.job,
                        name: eventData.data.jobSettings.label, 
                        image: eventData.data.jobSettings.image,
                        balance: eventData.data.capital, 
                        employees: eventData.data.employees, 
                    }; 

                    eventData.data.ranks.map((rank) => {
                        this.ranks.push({
                            title: rank.label, 
                            value: rank
                        });
                    })
                }
            }); 

            document.addEventListener('keyup', (event) => {
                if (event.key == 'Escape') {
                    this.close(); 
                }
            })
        }, 

        computed: {
        }
    }
</script>