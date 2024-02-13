# Ansible Tower Setup and Configuration Runbook
#### [Made by Mbandi Anyere Awankoudi with Scribe](https://scribehow.com/shared/Ansible_Tower_Setup_and_Configuration_Runbook__GQX3gIMDRNG88nu15EMAAg)
Ansible Tower Enterprise Deployment and Configuration Guide: A Comprehensive Handbook for Launching, Installing, and Setting up Ansible Tower in Enterprise Environments

**1. Navigate to https://aws.amazon.com/**

**2. Click "Sign In to the Console"**

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2023-07-11/1a297af5-c9d6-4c4c-8a12-96646b4e19a6/ascreenshot.jpeg?tl_px=1962,0&br_px=3455,840&force_format=png&width=560&wat_scale=50&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=437,8)

**3. Click the "Search" field.**

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2023-07-11/a3df7805-77bd-41a2-9983-8653d22554a2/ascreenshot.jpeg?tl_px=0,0&br_px=1493,840&force_format=png&width=560&wat_scale=50&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=198,-5)

**4. Type "ec2"**

**5. Click "EC2"**

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2023-07-11/e738148b-281d-41e3-98ea-f733fa8efdee/ascreenshot.jpeg?tl_px=225,0&br_px=1718,840&force_format=png&width=560&wat_scale=50&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=262,133)

**6. Click "Instances"**

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2023-07-11/f9398797-493b-459b-9f84-766cccfc1753/ascreenshot.jpeg?tl_px=0,94&br_px=1493,934&force_format=png&width=560&wat_scale=50&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=23,139)

**7. Provide the name "Ansible-Tower" and [[Search]] for [["CentOs 7"]]**

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2023-07-11/e1d78fdf-b428-415f-8de4-0711df75c28d/screenshot.png?tl_px=264,397&br_px=1010,817&force_format=png&width=560)

**8. [[Click]] on "AWS Marketplace AMIs (1****)"
[[Click]] Select "CentOs 7"**

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2023-07-11/a2654ea6-477a-4285-94ec-5b620ae94df9/screenshot.png?tl_px=341,275&br_px=1087,695&force_format=png&width=560)

**9. Click [[Select]]**

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2023-07-11/a08e7616-a55a-43b9-9cd7-f00372ac4941/screenshot.png?tl_px=371,286&br_px=1117,706&force_format=png&width=560)

**10. Confirm AMI Selection**

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2023-07-11/2d57968e-8d50-457a-82a1-4d9076cf201d/screenshot.png?tl_px=403,297&br_px=1149,717&force_format=png&width=560)

**11. [[Click]] "Instance type" and Select "t2.xlarge"  (You can as well use any Instance type with 4 Memory and 8 GB RAM)

[[Click]] on "Key pair name" and Select either an Existing Key Pair or Create a New one**

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2023-07-11/54917004-2628-4330-8974-df404af751bd/screenshot.png?tl_px=437,268&br_px=1183,688&force_format=png&width=560)

**12. Step**

**13. [[Expose]] "SSH", "HTTP" and "HTTPS"**

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2023-07-11/9fb7ade5-72dc-470a-91b7-87572679c49a/screenshot.png?tl_px=426,237&br_px=1172,657&force_format=png&width=560)

**14. Click on "Launch Instance"**

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2023-07-11/e57e0f75-c1e0-4c78-8fca-ef90b7ebe0ee/screenshot.png?tl_px=369,145&br_px=1115,565&force_format=png&width=560)

**15. Click here.**

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2023-07-11/c595d457-d08b-4050-8939-b5dc4b27f1fe/ascreenshot.jpeg?tl_px=1381,0&br_px=2874,840&force_format=png&width=560&wat_scale=50&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=262,31)

**16. Click "Connect"**

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2023-07-11/912a3ab0-95b8-46ab-abbf-a83b53686c1f/ascreenshot.jpeg?tl_px=1551,0&br_px=3044,840&force_format=png&width=560&wat_scale=50&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=262,30)

**17. Click here.**

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2023-07-11/7f220ae0-016b-4f61-a577-03dcad22a4f7/ascreenshot.jpeg?tl_px=0,650&br_px=1493,1490&force_format=png&width=560&wat_scale=50&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=68,139)

**18. [[1.]] Make sure to update the "username" from "ec2-user" to "centos" before running the "SSH Command"
[[2.]] Once you log in, [[NAVIGATE TO]] https://github.com/awanmbandi/ansible-tower-project/blob/master/ansible-tower-install.sh and run the commands in the order they're listed in the script
**

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2023-07-11/b72f9ade-10bd-4835-8429-b7bc0e9aa9b0/screenshot.png?tl_px=628,128&br_px=1374,548&force_format=png&width=560)

**19. [[1.]] After Running the "vi inventory" [[Command]], Update the following strings <<admin_password=''>> and <<pg_password=''>>

[[2. "Save" and "Quit"]] the file once you're done editing **

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2023-07-11/b2e71752-7d39-48b6-a02f-6630a4c4024d/screenshot.png?tl_px=367,150&br_px=1113,570&force_format=png&width=560)

**20. [[NOTE:]] Make sure you have the [[status]] 
"The setup process completed successfully" after executing the command "sudo ./setup.sh"**

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2023-07-11/c019d48d-7891-44d9-9520-20759c27cf9e/screenshot.png?tl_px=897,588&br_px=1643,1008&force_format=png&width=560)

**21. [[1. Navigate to EC2]] and Copy your Tower Instance Public IP and Paste on the Browser >> Click on Advance and Click on Proceed**

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2023-07-11/d3621149-ff97-4f8a-97ba-22ef5b58c104/screenshot.png?tl_px=26,82&br_px=772,502&force_format=png&width=560)

**22. [[Login to TOWER:]] Provide your Tower Username and Password. 
Click on "Login"**

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2023-07-11/4695cee1-227b-45fe-914f-b4182dc6088b/screenshot.png?tl_px=0,0&br_px=560,373&force_format=png)

**23. [[Congratulations!!!]] Confirm you have this Ansible Tower Sign In Page**

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2023-07-11/48f42661-4d53-4025-9d42-4a51a2965df6/screenshot.png?tl_px=12,73&br_px=758,493&force_format=png&width=560)

**24. [[1. SIGN-UP]] Navigate to https://www.redhat.com/wapps/ugc/register.html **

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2023-07-11/d930bf48-6e58-4943-8a71-6017148c3c43/screenshot.png?tl_px=0,193&br_px=740,613&force_format=png&width=560)

**25. [[Sign-Up]] Continuation**

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2023-07-11/51a253de-6e57-4b65-bfec-964d19eb3230/screenshot.png?tl_px=0,104&br_px=654,524&force_format=png&width=560)

**26. Click [[SUBMIT]] **

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2023-07-11/0519b114-13c8-4693-b475-4caa7832e13c/screenshot.png?tl_px=0,53&br_px=710,473&force_format=png&width=560)

**27. [[Navigate]] To Your Email Account [[Confirm The Email]]**

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2023-07-11/041b6f4e-3675-4eed-b81f-ed17096afeb8/screenshot.png?tl_px=0,0&br_px=595,390&force_format=png&width=560)

**28. Email Confirmation**

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2023-07-11/2597121b-50c6-453a-a508-c527d124db0f/screenshot.png?tl_px=0,0&br_px=401,196&force_format=png&width=560)

**29. [[1. Navigate]] to  https://access.redhat.com/management/subscriptions
[[2. Sign In]] Provide [[Username]] and [[Password]]**

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2023-07-11/aaae70bc-92fc-455a-a319-361c2fc802d9/screenshot.png?tl_px=0,21&br_px=682,441&force_format=png&width=560)

**30. [[1. REQUEST SUBSCRIPTION]] At this point you need a Certificate before you can Login to Tower**

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2023-07-11/767fb897-3548-4c61-accc-090ebcd2c865/screenshot.png?tl_px=22,98&br_px=768,518&force_format=png&width=560)

**31. Click "Start Your Trial"**

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2023-07-11/06f0167e-2f68-4cfa-9a72-59b05583a52b/screenshot.png?tl_px=11,44&br_px=757,464&force_format=png&width=560)

**32. [[1.]] Accept License Agreement 
[[2.]] Click Submit 

[[NOTE:]] Once you [[Submit]] Your Subscription [[Download]] Will Begin Immediately**

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2023-07-11/30f27971-ccfa-4f9e-92f1-7ec819d73190/screenshot.png?tl_px=0,0&br_px=654,407&force_format=png&width=560)

**33. [[Confirm]] that your Subscription was [[Successfully Downloaded]]**

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2023-07-11/b75d1afb-a688-4128-ab12-4ada41766026/screenshot.png?tl_px=15,54&br_px=761,474&force_format=png&width=560)

**34. [[1. Navigate]] to https://access.redhat.com/management/subscriptions
[[2. Confirm]] that you have the below visual

[[NOTE!!]]PLEASE FOLLOW THROUGH WITH THE STEPS AFTER THIS TO GENERATE A CERTIFICATE**

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2023-07-11/e149f704-fc44-4a66-b4f3-2ecda0b9f661/screenshot.png?tl_px=11,35&br_px=757,455&force_format=png&width=560)

**35. [[1. GENERATE A SUBSCRIPTION]]
[[2. NOTE:]] ONLY Engage This Step If You Were Not Assigned a Subscription **

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2023-07-11/d15545f5-30ed-4e68-969f-a20ed5be42a0/screenshot.png?tl_px=0,17&br_px=702,437&force_format=png&width=560)

**36. [[SUBMIT]] To Generate A Subscription**

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2023-07-11/11f0677d-0fa5-41b1-b64a-466497c76687/screenshot.png?tl_px=0,33&br_px=681,453&force_format=png&width=560)

**37. Click on "Add Subscription"**

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2023-07-11/1db81fab-767e-409e-8b9b-71f887c24287/screenshot.png?tl_px=0,26&br_px=716,446&force_format=png&width=560)

**38. Define the "Entitlement" and Click on "Submit"**

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2023-07-11/ce0f5cab-052b-49e0-ba9f-0d4f3a4eed0e/screenshot.png?tl_px=209,71&br_px=955,491&force_format=png&width=560)

**39. Click on "Export Manifest"**

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2023-07-11/8e9f9286-626d-4ad4-8928-f37d335fabd6/screenshot.png?tl_px=211,67&br_px=957,487&force_format=png&width=560)

**40. [[1. nAVIGATE]] Back to your Tower Login Page http://Tower_Pub_IP
[[2.]] Click on "Browse" and Select your "Manifest" Zip from Downloads
[[3.]] Check the Box to Accept The License Agreement 
[[4.]] Click "Submit"**

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2023-07-11/254714f5-aef2-4133-ac8a-b988fc83ea08/screenshot.png?tl_px=25,53&br_px=771,473&force_format=png&width=560)

**41. Click on "SUBMIT"**

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2023-07-11/a08c24dc-346f-473b-b08f-c77470b3e28c/screenshot.png?tl_px=15,0&br_px=761,384&force_format=png&width=560)

**42. [[Congratulations!!!!!]] 😃😃 Welcome to The Ansible Tower Dashboard**

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2023-07-11/4167c638-f2a6-41d8-84ae-7671bd822ca6/screenshot.png?tl_px=102,57&br_px=848,477&force_format=png&width=560)
#### [Made with Scribe](https://scribehow.com/shared/Ansible_Tower_Setup_and_Configuration_Runbook__GQX3gIMDRNG88nu15EMAAg)


