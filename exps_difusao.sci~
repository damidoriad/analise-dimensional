// Exploração da ideia de difusão no manifold...
// Veja só isso: peguei um sinal caótico, com apenas 
// um grau de liberdade. O código está em Julia, mas 
// é muito simples, então vai como está. Se não entender algo, pode perguntar...
x = zeros(500);
x[1]=0.7;
r = 3.7;
for n in 2:length(x)
    x[n] = r*x[n-1]*(1-x[n-1]);
end
plot(x)
// até parece periódico, né, mas não é! Portanto não tem 
// F0 que se possa estimar, e esse sinal nada mais 
// é do que causal, sem inovação nenhuma, como se pode 
// ver pelo manifold 1D que aparece quando ploto os pontos (x[n],x[n+1],x[n+2])
plot3d(x[n],x[n+1],x[n+2])
// agora vou inserir um pouco de inovação no sinal caótico, assim:
u=0.05*(rand(length(x)) .> 0.95);
// veja isso como se fossem strokes que vão excitar a dinâmica caótica, assim:
for n in 2:length(x)
    x[n] = r*x[n-1]*(1-x[n-1])+u[n];
end
plot(x)
// até que dá para ver que alguma coisa mudou, mas é difícil 
//saber onde estão as inovações, desse ponto de vista. No entanto, 
// do ponto de vista do manifold de baixa dimensão (1D), veja só:
plot3d()






