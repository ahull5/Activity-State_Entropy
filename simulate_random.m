function [TCs, Act_states, Adjusted_weights] = simulate_random(decay)
%This function generates simulated voxel time-courses from a set number of random activity states.
%Each activity state has a sinusoidal weighting vector with a random
%period. The average weights of the weighting vectors are set using an
%exponential decay weighting function. The function takes the base of this
%exponential decay function as its input. The parameters below can also be
%altered. 

%set parameters

num_act_states = 150; %number of activity states that will be used to simulate the data
num_sim = 20; %number of simulated subjects
num_voxels = 85459; %number of voxels to be simulated
num_TRs = 180; %number of time points to be simulated
low_bound = 5; %lowest period that the activity states can oscillate with
high_bound = 100; %highest period that the activity states can oscillate with
noise_amp = 0.2; %amplitude of random noise that will be added to the data matrix

weighted_act_states = cell(num_act_states,1);
TCs = cell(num_sim,1);
Act_states = cell(num_sim,1);
Adjusted_weights = cell(num_sim,1);
sin_function = zeros(num_TRs, num_act_states);
adjusted_weights = zeros(num_TRs, num_act_states);

b = (2 - 2*decay) / (decay - decay^2);
weighting_function = b * decay.^(1:num_act_states);


for i = 1:num_sim
%activity state creation

act_states = randn(num_act_states, num_voxels);

%weight creation

weights =2*rand(num_TRs,num_act_states);

%phase shift creation

phases = 100*rand(num_act_states,1);

%period
periods = linspace(low_bound,high_bound,num_act_states);
periods =periods(randperm(num_act_states));

% sine functions

for j = 1:num_act_states
    sin_function(:,j) = sin(2*pi*((1:num_TRs)+phases(j))/(0.5*periods(j)))+1;
end

%adjusted weights

for j = 1:num_act_states
    adjusted_weights(:,j) = (weights(:,j) + sin_function(:,j)) * weighting_function(j);
end


%weighting the activity states
for j = 1:num_act_states
    weighted_act_states{j} = adjusted_weights(:,j) * act_states(j,:);
end
% noise
noise = noise_amp * rand(num_TRs,num_voxels) - noise_amp/2;

%data generation

simulated_activity = sum(cat(3,weighted_act_states{:}),3) + noise;

TCs{i} = simulated_activity;
Act_states{i} = act_states;
Adjusted_weights{i} = adjusted_weights; 
end
end