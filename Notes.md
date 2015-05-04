# Code Review

## Startup

It worked!  Everything came up fine.  This is a good omen.

## Assets

You were delivering bootstrap.js twice.  Remember that a gem (even if it is
fetched via the `git://` directive, will install locally on your system, _but
not_ local to your project.

## FactoryGirl

Use the associations.  Also, factories are named in the singular

# Votes#find_or_create

Something about this route and its associated action suggests that there's some
work to be done.  I might suggest that you set things up for voting from the
front end such that an upvote does `POST /votes/ {style: -1, parent_id: "33",
parent_type: "Question" }`

So that you could do something like

    votes = params[:parent_type].constanize.find(params[:parent_id]).votes
    if votes.count > 0
      votes.destroy_all
    end
    votes.create(params[:style])
