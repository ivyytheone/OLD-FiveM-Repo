<template>
    <v-card class="ma-5" color="secondary" :elevation="2">
        <v-card-title style="display: flex; justify-content: space-between; align-items: center;">
            <div>
                <span>Medarbetare</span>
            </div>

            <div>
                <v-btn color="success" text @click="hire()">Anställ näsmaste person</v-btn>
            </div>
        </v-card-title>

        <v-divider></v-divider>

        <v-card-text style="max-height: 60vh; overflow-y: scroll;">
            <v-container>
                <v-row>
                    <v-col cols="12" sm="6" md="5.3" v-for="item in jobData.employees">
                        <div>
                            <v-card outlined color="accent" :elevation="0">
                                <v-card-title>
                                    <span style="font-size: 23px">
                                        {{ item.firstname + ' ' + item.lastname }}
                                    </span>
                                </v-card-title>

                                <v-divider></v-divider>

                                <v-card-text style="display: flex; flex-direction: column;">
                                    <span style="font-size: 18px; margin: 2px;">
                                        Personummer: {{ item.id }}
                                    </span>

                                    <span style="font-size: 18px; margin: 2px;">
                                        Rank: {{ item.job_grade }}
                                    </span>

                                    <span style="font-size: 18px; margin: 2px;">
                                        Tillgång till panel: {{ item.hasAccess > 0 ? 'Ja' : 'Nej' }}
                                    </span>
                                </v-card-text>

                                <v-divider></v-divider>

                                <v-card-actions>
                                    <v-btn color="success" text @click="editPlayer(item)">Redigera</v-btn>
                                    <v-btn color="error" text @click="firePlayer(item)">Sparka</v-btn>
                                </v-card-actions>
                            </v-card>
                        </div>
                    </v-col>
                </v-row>
            </v-container>
        </v-card-text>
    </v-card>

    <v-row justify="center">
        <v-dialog v-model="dialog" max-width="600px">
            <v-card color="secondary">
                <v-card-title style="display: flex; align-items: center; justify-content: space-between;">
                    <span class="headline">Redigera {{ currentPlayer.firstname + ' ' + currentPlayer.lastname }}</span>
                </v-card-title>

                <v-card-text>
                    <v-row no-gutters>
                        <v-col cols="12" sm="13" class="ma-2">
                            <v-card color="primary">
                                <v-card-title>Behörigheter</v-card-title>

                                <v-divider></v-divider>

                                <v-card-text>
                                    <v-row>
                                        <v-col cols="12" sm="12">
                                            <v-select
                                                v-model="newRank"
                                                density="compact" 
                                                variant="outlined"
                                                :items="grades"
                                                item-title="title"
                                                item-value="value"
                                                persistent-hint
                                                return-object
                                                single-line
                                            ></v-select>
                                        </v-col>
                                    </v-row>
                                </v-card-text>
                            </v-card>
                        </v-col>

                        <v-col cols="12" sm="13"  class="ma-2">
                            <v-card color="primary">
                                <v-card-title>Diverse</v-card-title>

                                <v-divider></v-divider>

                                <v-card-text>
                                    <v-row>
                                        <v-col cols="12" sm="12">
                                            <v-checkbox label="Tillgång till panel" v-model="get" @click="changeAccess()"></v-checkbox>
                                        </v-col>
                                    </v-row>
                                </v-card-text>
                            </v-card>
                        </v-col>
                    </v-row>
                </v-card-text>

                <v-card-actions>
                    <v-btn color="success" text @click="savePlayer()">Spara</v-btn>
                    <v-btn color="error" text @click="dialog = false;">Avbryt</v-btn>
                </v-card-actions>
            </v-card>
        </v-dialog>
    </v-row>

    <v-row justify="center">
        <v-dialog v-model="fireDialog" max-width="600px">
            <v-card color="secondary">
                <v-card-title style="display: flex; align-items: center; justify-content: space-between;">
                    <span class="headline">Sparka {{ this.currentPlayer.firstname + ' ' + this.currentPlayer.lastname }}</span>
                </v-card-title>

                <v-card-text>
                    Är du säker på att sparka {{ this.currentPlayer.firstname }}? 
                </v-card-text>

                <v-card-actions>
                    <v-btn color="success" text @click="fire()">Bekräfta</v-btn>
                    <v-btn color="error" text @click="fireDialog = false;">Avbryt</v-btn>
                </v-card-actions>
            </v-card>
        </v-dialog>
    </v-row>
</template>

<script>
    export default {
        name: 'Employees',

        props: ['jobData', 'ranks'],

        data: () => ({
            dialog: false, 
            fireDialog: false, 

            currentPlayer: null,

            newRank: null,
            grades: [], 
        }),    

        methods: {
            editPlayer(player) {
                this.dialog = true;

                this.ranks.map((rank) => {
                    this.grades = [...this.grades, { title: rank.title, value: rank.value.grade }]; 
                    this.newRank = { title: player.job_grade, value: player.job_grade };
                })

                this.$emit('sendMessage', 'getCharacterData', { id: player.identifier }, (character) => {
                    this.currentPlayer = {
                        id: character.id, 
                        firstname: character.firstname, 
                        lastname: character.lastname, 
                        job_grade: character.job_grade, 
                        hasAccess: character.hasAccess, 
                    }; 
                })
            }, 

            savePlayer() {
                this.dialog = false;
                
                this.$emit('sendMessage', 'saveCharacterData', { job: this.jobData.job, rank: this.newRank, data: this.currentPlayer }, (response) => {
                    this.$emit('updatePlayer', {
                        id: this.currentPlayer.id, 
                        hasAccess: this.currentPlayer.hasAccess,
                        job_grade: this.newRank
                    })
                })

                this.grades = [];
            }, 

            hire() {
                this.$emit('sendMessage', 'hirePlayer', { job: this.jobData.job }, (response) => {
                    this.jobData.employees = [...this.jobData.employees, response];
                });
            }, 

            firePlayer(player) {
                this.$emit('sendMessage', 'getCharacterData', { id: player.identifier }, (character) => {
                    this.currentPlayer = {
                        id: player.identifier, 
                        firstname: player.firstname, 
                        lastname: player.lastname, 
                        job_grade: player.job_grade, 
                        hasAccess: player.hasAccess, 
                    }; 
                })

                this.fireDialog = true;
            }, 

            fire() {
                this.$emit('sendMessage', 'firePlayer', { player: this.currentPlayer }, (response) => {
                    this.jobData.employees = this.jobData.employees.filter((player) => {
                        return player.id != this.currentPlayer.id;
                    })

                    this.fireDialog = false;
                })
            }, 

            changeAccess() {
                console.log(JSON.stringify(this.currentPlayer))

                this.currentPlayer.hasAccess = this.currentPlayer.hasAccess > 0 ? 0 : 1;
            }
        }, 

        computed: {
            get() {
                return this.currentPlayer.hasAccess > 0 ? true : false;
            }, 

            set(value) {
                this.accessToPanel = value;
            }
        }
    }
</script>