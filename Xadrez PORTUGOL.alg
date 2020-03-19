algoritmo "Baita Xadrez do Kelvin"

// Função : Jogo de Xadrez
// Autor :  Kelvin Rian Lourenço
// Data :  06/11/2018 ~ 29/11/2018
// O JOGO ---- PERDESTE :)

var
   Casa: vetor[0..8, 0..8] de Inteiro
   Peca: vetor[0..8, 0..8] de Caractere
   L, C, Cont, Jogador: Inteiro
   Fim, Invalido: Logico
   Troca, enter: Caractere


Procedimento MostrarTabuleiro()
Inicio
      Para L <- 0 ate 8 faca
           Para C <- 0 ate 8 faca
                Se (Peca[L,C] = "Vazio") entao
                   Se (Casa[L,C] < 10) entao
                      Escreva (Casa[L,C], "      ")
                   Senao
                        Escreva (Casa[L,C], "     ")
                   FimSe
                Senao
                     Escreva (Peca[L,C]:8)
                FimSe
           FimPara
           Escreval()
           Escreval()
           Escreval()
           Escreval()
      FimPara
FimProcedimento



Funcao FimDeJogo(L,C: inteiro): Logico
Var
Resposta: Logico
NumDeREIS: inteiro
inicio
      Resposta <- Verdadeiro
      NumDeREIS <- 0
      Para L <- 0 ate 8 faca
           Para C <- 0 ate 8 faca
                Se (Peca[L,C] = "REI") ou (Peca[L,C] = "rei") entao
                   NumDeREIS <- NumDeREIS + 1
                FimSe
           FimPara
      FimPara
      Se (NumDeREIS = 2) entao
         Resposta <- Falso
      FimSe
      Retorne Resposta
FimFuncao


Funcao JogadaINVALIDA (A, B: inteiro):Logico
var
   Resposta: Logico
Inicio
      Resposta <- Falso
      Se (A * 10 + B > 99) entao
         Resposta <- Verdadeiro
      FimSe
      Retorne Resposta
FimFuncao



inicio

      //Matriz Indiciando o Número de Cada Casa

      Para L <- 0 ate 8 faca
           Para C <- 0 ate 8 faca
                Se (C = 0) entao
                   Casa[L,C] <- L
                Senao
                     Casa[L,C] <- (L * 10) + C
                FimSe
           FimPara
      FimPara

      //Montagem da Matriz PECA para indicar a posição Inicial de Cada Peça

      Para L <- 0 ate 8 faca
           Para C <- 0 ate 8 faca
                Se (L = 1) entao
                   Se (C = 1) ou (C = 8) entao
                      Peca[L,C] <- "torre"
                      senao
                      Se (C = 2) ou (C = 7) entao
                         Peca[L,C] <- "cavalo"
                         senao
                         Se (C = 3) ou (C = 6) entao
                            Peca[L,C] <- "bispo"
                            senao
                            se (C = 4) entao
                               Peca[L,C] <- "rainha"
                               senao
                               Se (C = 5) entao
                                  Peca[L,C] <- "rei"
                                  senao
                                  Se (C = 0) entao
                                     Peca[L,C] <- "Vazio"
                                  FimSe
                               FimSe
                            Fimse
                         FimSe
                      FimSe
                   FimSe
                   senao

                   Se (L = 0) ou (C = 0) entao
                      Peca[L,C] <- "Vazio"
                      senao

                      Se (L = 2) e (C > 0) entao
                         Peca[L,C] <- "peão"
                         senao

                         Se (L = 7) e (C > 0) entao
                            Peca[L,C] <- "PEÃO"
                            senao

                            Se (L = 8) entao
                               Se (C = 1) ou (C = 8) entao
                                  Peca[L,C] <- "TORRE"
                                  senao
                                  Se (C = 2) ou (C = 7) entao
                                     Peca[L,C] <- "CAVALO"
                                     senao
                                     Se (C = 3) ou (C = 6) entao
                                        Peca[L,C] <- "BISPO"
                                        senao
                                        Se (C = 4) entao
                                           Peca[L,C] <- "RAINHA"
                                           senao
                                           Se (C = 5) entao
                                              Peca[L,C] <- "REI"
                                           FimSe
                                        FimSe
                                     FimSe
                                  Fimse
                               FimSe
                               senao
                                    Peca[L,C] <- "Vazio"
                            FimSe
                         FimSe
                      FimSe
                   FimSe
                FimSe
           FimPara
      FimPara

      //Tela De Início
      Escreval ("--------------------------------------")
      Escreval ("         Baita Xadrez do Kelvin       ")
      Escreval ("--------------------------------------")
      Escreval ()
      Escreval ("Pressione ENTER para Iniciar")
      leia (enter)
      LimpaTela

      Cont <- 1

      //JOGADAS
      Repita
            MostrarTabuleiro()
            Se (Cont%2 = 1) entao
               Jogador <- 1
            Senao
                 Jogador <- 2
            FimSe
            Escreval ("Jogador ", Jogador)
            Escreval ()
            Escreval ("Selecionar Peça da")
            Escreva ("Linha: ")
            Leia (L)
            Escreva ("Coluna: ")
            Leia (C)

            Invalido <- JogadaInvalida(L,C)

            Se (Invalido = Falso) entao
               Troca <- Peca[L,C]
               Peca[L,C] <- "Vazio"
               Escreval()
               Escreval ("Mover Para:")
               Escreva ("Linha: ")
               Leia (L)
               Escreva ("Coluna: ")
               Leia (C)

               Invalido <- JogadaInvalida(L,C)

               Se (Invalido = Falso) entao
                  Peca[L,C] <- Troca
               Senao
                    Escreval()
                    Escreval ("JOGADA INVÁLIDA! pressione ENTER para continuar")
                    leia (enter)
                    LimpaTela
               Fimse

               LimpaTela
               Cont <- Cont + 1
               Fim <- FimDeJogo(L,C)

            Senao
                 Escreval()
                 Escreval ("JOGADA INVÁLIDA! pressione ENTER para continuar")
                 Leia (enter)
                 LimpaTela
            FimSe

      Ate (Fim = Verdadeiro)

      Escreval ("FIM DO JOGO!")
      Escreval ()
      Escreval ("JOGADOR ", Jogador, " VENCEU!")

fimalgoritmo
