function [locations]=findSynapseLocationsFromStruct(synapseStruct)
locations=zeros(size(synapseStruct,2),3);
for i = 1:size(synapseStruct,2)
    x=mean(synapseStruct(i).grouped(:,1));
    y=mean(synapseStruct(i).grouped(:,2));
    z=mean(synapseStruct(i).grouped(:,3));
    locations(i,:)=[x,y,z];
end


end