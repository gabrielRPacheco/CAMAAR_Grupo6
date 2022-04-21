<script setup>
  import { ref, reactive } from "vue";
  import { useRouter } from 'vue-router'
  import { credentialsStore } from "@/stores/credentials";
  import {useQuasar} from 'quasar'

  const credentials = credentialsStore();
  const $q = useQuasar()
  const router = useRouter()
  const { authenticate } = credentials;

  // data
  const form = ref(null)

  const user = reactive({
    email: null,
    password: null,
  });

  // methods
  const cadastrar = async () =>{
    const isValid = await form.value.validate()
    if(isValid){
      try {
        const res = await authenticate(user);
        if(res) {
          console.log('res', router.name)
          router.push({path: '/home'})
        }
      } catch (e) {
        console.error(e);
          $q.notify({
          message: 'Falha ao fazer login.',
          position: 'top',
          color: 'negative'
        })
      }
    }
    else{
      alert("Preencha todos os dados para prosseguir");
    }
  }
</script>
<template>
<div class="row">
  <q-card class="rounded-border q-pa-xl justify-center col-12 text-center">
    <h1 class="text-h3">Cadastrar Aluno</h1>
    <q-form ref="form" class="q-gutter-sm q-mt-xl row">
      <q-input
        rounded
        outlined
        label="Nome"
        type="text"
        v-model="user.name"
        class="col-12"
        lazy-rules
        :rules="[val => !!val || 'Nome Obrigatório']"
      ></q-input>
	  <q-input
        rounded
        outlined
        label="Curso"
        type="text"
        v-model="user.curso"
        class="col-12"
        lazy-rules
        :rules="[val => !!val || 'Curso Obrigatório']"
      ></q-input>
	  <q-input
        rounded
        outlined
        label="Matricula"
        type="text"
        v-model="user.matricula"
        class="col-12"
        lazy-rules
        :rules="[val => !!val || 'Matricula Obrigatória']"
      ></q-input>
	   <q-input
        rounded
        outlined
        label="Usuario"
        type="text"
        v-model="user.usuario"
        class="col-12"
        lazy-rules
        :rules="[val => !!val || 'Usuario Obrigatório']"
      ></q-input>
      <q-input
        rounded
        outlined
        label="Formação"
        type="text"
        v-model="user.formacao"
        class="col-12"
        lazy-rules
        :rules="[val => !!val || 'Formação Obrigatória']"
      ></q-input>
      <q-input
        rounded
        outlined
        label="Ocupação"
        type="text"
        v-model="user.ocupacao"
        class="col-12"
        lazy-rules
        :rules="[val => !!val || 'Ocupação Obrigatória']"
      ></q-input> 
      <q-input
        rounded
        outlined
        label="E-Mail"
        type="email"
        v-model="user.email"
        class="col-12"
        lazy-rules
        :rules="[val => !!val || 'E-Mail Obrigatório']"
        data-test-email="email"
      ></q-input>
      <q-input
        type="password"
        rounded
        outlined
        label="Senha"
        v-model="user.password"
        class="col-12"
        :rules="[val => !!val || 'Senha Obrigatória']"
        data-test-senha="senha"
      ></q-input>
      <q-btn
        rounded
        color="secondary"
        class="col-12"
        size="lg"
        @click="cadastrar"
        data-test-button-login="cadastrar"
      >Cadastrar</q-btn>
    </q-form>
  </q-card>
</div>
</template>

<style scoped>
.rounded-border{
  border-radius: 25px;
}
</style>
