package com.liquibase.demo.profile;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liquibase.demo.breed.BreedRepository;

@Service
public class ProfileService {

    private final ProfileRepository profileRepository;
    private final BreedRepository breedRepository;

    @Autowired
    private ProfileService(ProfileRepository profileRepository, BreedRepository breedRepository) {
        this.profileRepository = profileRepository;
        this.breedRepository = breedRepository;
    }

    public void addProfile(NewProfileRequest newProfileRequest) {
        Profile profile = new Profile();
        profile.setName(newProfileRequest.getName());
        profile.setHeight(newProfileRequest.getHeight());
        profile.setWeight(newProfileRequest.getWeight());
        profile.setDescription(newProfileRequest.getDescription());
        profile.setImageUrl("/img/sample.jpg");
        if (newProfileRequest.getBreedId() != null) {
            profile.setBreed(breedRepository.findById(newProfileRequest.getBreedId())
                    .orElse(null));
        }
        profileRepository.save(profile);
    }

}
