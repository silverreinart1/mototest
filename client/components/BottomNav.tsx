import { Home, Users, Map, User, HelpCircle } from "lucide-react";
import { Link, useLocation } from "react-router-dom";

export default function BottomNav() {
  const location = useLocation();
  
  const navItems = [
    { icon: Home, label: "Home", path: "/" },
    { icon: Users, label: "Participate", path: "/participate" },
    { icon: Map, label: "Map", path: "/map" },
    { icon: User, label: "Profile", path: "/profile" },
    { icon: HelpCircle, label: "Help", path: "/help" },
  ];

  return (
    <div className="fixed bottom-0 left-0 right-0 bg-[#1D1F24] rounded-t-3xl pb-safe">
      <div className="flex justify-center items-center px-3 pt-3 pb-0 bg-[#1D1F24]">
        {navItems.map((item) => {
          const Icon = item.icon;
          const isActive = location.pathname === item.path;
          
          return (
            <Link
              key={item.path}
              to={item.path}
              className="flex flex-col items-center gap-1.5 flex-1"
            >
              <Icon
                className={`w-6 h-6 ${
                  isActive ? "text-white" : "text-[#676D75]"
                }`}
                strokeWidth={2}
              />
              <span
                className={`text-xs font-poppins ${
                  isActive ? "text-white" : "text-[#676D75]"
                }`}
              >
                {item.label}
              </span>
            </Link>
          );
        })}
      </div>
      <div className="h-7 bg-[#1D1F24] flex items-start justify-center pt-4">
        <div className="w-[135px] h-[5px] rounded-full bg-[#B9C0C9]" />
      </div>
    </div>
  );
}
