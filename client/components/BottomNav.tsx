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
    <div className="fixed bottom-0 left-0 right-0 bg-gradient-to-t from-moto-dark to-moto-dark-lighter rounded-t-3xl pb-safe shadow-2xl">
      <div className="flex justify-center items-center px-3 pt-3 pb-0 bg-transparent">
        {navItems.map((item) => {
          const Icon = item.icon;
          const isActive = location.pathname === item.path;

          return (
            <Link
              key={item.path}
              to={item.path}
              className="flex flex-col items-center gap-1.5 flex-1 transition-all transform hover:scale-110"
            >
              <div
                className={`p-2 rounded-xl transition-all ${
                  isActive
                    ? "bg-moto-orange/20 text-moto-orange"
                    : "text-gray-500 hover:text-gray-400"
                }`}
              >
                <Icon className="w-6 h-6" strokeWidth={2} />
              </div>
              <span
                className={`text-xs font-poppins font-semibold ${
                  isActive ? "text-moto-orange" : "text-gray-500"
                }`}
              >
                {item.label}
              </span>
            </Link>
          );
        })}
      </div>
      <div className="h-7 bg-transparent flex items-start justify-center pt-4">
        <div className="w-[135px] h-[5px] rounded-full bg-moto-charcoal" />
      </div>
    </div>
  );
}
