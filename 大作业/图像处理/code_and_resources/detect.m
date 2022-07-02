function d = detect(P,L)
    load(['feature',L+'0','.mat']);
    feature = featureExtract(P,L);
    d = 1 - sum(sqrt(feature).*sqrt(AvFeature));
end