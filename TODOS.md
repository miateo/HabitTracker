# Problem To Fix (Ranked based on urgency)

- [x] Find out how to save the data on the device
- [x] Make relationship between Habit & LoggedHabit
- [x] _Make so that when you delete a Habit Object it deletes all the occurrences of that habit in the loggedHabit database_ <-- Solved by Relationship rule cascade
- [/] Add log & deLog capabilities to the DisplayHabits struct
- [ ] Make habits able to be logged on the TodayView and make sure that the logic behind it is correct
- [x] Make HabitListView display _Habits_ only if they aren't logged on that day
      -> basically if they are in the loggedHabits array or todayHabits array (I think <- need to check)
- [ ] Add screen warning when trying to delete habits
- [ ] Create Day, Weeks, years struct or a way to group them into it to save them
- [ ] Make the TabBar icon show the current day icon
- [ ] Fix the warnings that appear when you try to type the name of the new Habit (In the console of XCode)
- [ ] Fix week stat graph
- [ ] Make week stat scroll between weeks
- [ ] Make month graph
- [ ] Make month graph scroll between month
- [ ] Make quotes space works
- [ ] Make a way to display the relevant information on the appropriate charts

## NEW FEATURES IDEAS

- [ ] Add Day recap func
- [ ] Add Edit Habit capability

## Bugs

- [x] Found that the array that displays "Todays habits" doesn't refresh when a new habit is created apparently
      --> prob reason: they are yet to be logged and the displayhabits.habits has yet to be created?
- [x] Add noAction to NewHabit if weekday isn't set
- [x] Fix weekdays order in FrequencyPicker.swift
- [!] Found that when removing habits from the HabitView sheet it doesn't display the correct habits (name, icon , etc)
  -> Basically if there is more than 1 habit on the HabitView and u start deleting them, the last habit u delete remains and start deleting
  habits on the modelcontext habit list even if it shoulden't > reason: inconsistency between ui and data --> need to fix how the ForEach works and
  how the modelcontext is structured (i think)
  ->EDIT: basically the .onDelete for some reason only permits to delete the first index <-- se si cancella un index non uguale a [0] viene cancellato l'habit presente in todayview
  ->NOTE: if new habits not specific to that day are created the list for some reason refresh
  ->EDIT: the onDelete function receve _only_ the index that corrispond to the habit the action is performed on, so rn the index is wrong because it returns the index
  inside the loggedHabits array instead of the whole AllHabits
  -->POSSIBLE FIX: make a function that iterates inside the AllHabits array and then return the index of the right habit to delete
  -->2nd POSSIBLE FIX: make the .onDelete call an external function that always check the real index of the habit u're referring to <-- more reutilizable
  ---->LOGIC CHANGE: The HabitListView should only display _habits_ that are not for that specific day and not the loggedHabits.

- [x] habits get displayed the number of times it's logged in HabitListView -> probably it's displaying the loggedHabits array inside it?
      --> Need to change the array that gets fed to HabitListView -> it's in AllHabits: _add a filter_

- [ ] When deleting from HabitListView program crashes
- [ ] Chenges to log status of habit not updated in HabitListView
- [ ] When logging habits on HabitListView the log doesn't persist and when delogging it the program crashes
