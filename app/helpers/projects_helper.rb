module ProjectsHelper
    def find_user_from_share(share)
        User.find(share.user_id)
    end
end